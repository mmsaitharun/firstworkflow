sap.ui.define([
	"sap/ui/core/UIComponent",
	"sap/ui/Device",
	"com/test/approver/approverpage/model/models"
], function (UIComponent, Device, models) {
	"use strict";

	return UIComponent.extend("com.test.approver.approverpage.Component", {

		metadata: {
			manifest: "json"
		},

		var contextModel;

		/**
		 * The component is initialized by UI5 automatically during the startup of the app and calls the init method once.
		 * @public
		 * @override
		 */
		init: function () {
			// call the base component's init function
			UIComponent.prototype.init.apply(this, arguments);

			// enable routing
			this.getRouter().initialize();

			// set the device model
			this.setModel(models.createDeviceModel(), "device");
			
			// get task data
			var startupParameters = this.getComponentData().startupParameters;
			var taskModel = startupParameters.taskModel;
			var taskData = taskModel.getData();
			var taskId = taskData.InstanceID;

			// initialize model
			contextModel = new sap.ui.model.json.JSONModel("/bpmworkflowruntime/rest/v1/task-instances/" + taskId + "/context");
			contextModel.setDefaultBindingMode(sap.ui.model.BindingMode.OneWay);
			this.setModel(contextModel);

			startupParameters.inboxAPI.addAction({
				action: "Reject",
				label: "Reject"
			}, function (button) {
				this._completeTask(taskId, false, false);
			}, this);

			startupParameters.inboxAPI.addAction({
				action: "Approve",
				label: "Approve"
			}, function (button) {
				this._completeTask(taskId, true, true);
			}, this);
		},
		
		_setIsApproved: function (contextModel) {
			contextModel
		}

		_completeTask: function (taskId, approvalStatus, isApproved) {
			var token = this._fetchToken();
			$.ajax({
				url: "/bpmworkflowruntime/rest/v1/task-instances/" + taskId,
				method: "PATCH",
				contentType: "application/json",
				async: false,
				data: "{\"status\": \"COMPLETED\", \"context\": {\"approved\":\"" + approvalStatus + "\", \"isApproved\":\"" + approvalStatus + "\"}}",
				headers: {
					"X-CSRF-Token": token
				}
			});
			this._refreshTask(taskId);
		},

		_fetchToken: function () {
			var token;
			$.ajax({
				url: "/bpmworkflowruntime/rest/v1/xsrf-token",
				method: "GET",
				async: false,
				headers: {
					"X-CSRF-Token": "Fetch"
				},
				success: function (result, xhr, data) {
					token = data.getResponseHeader("X-CSRF-Token");
				}
			});
			return token;
		},

		_refreshTask: function (taskId) {
			this.getComponentData().startupParameters.inboxAPI.updateTask("NA", taskId);
		}
	});
});
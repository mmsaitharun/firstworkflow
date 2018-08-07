{
	"contents": {
		"83f35573-68b9-4792-bf59-50220dadd5e6": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "testworkflow",
			"subject": "testworkflow",
			"name": "testworkflow",
			"documentation": "Test Workflow Project",
			"lastIds": "7abf21bc-6d10-4c9a-a076-bb52bade4f13",
			"events": {
				"ec79be9d-6433-4995-88a3-9a3b46971059": {
					"name": "StartEvent"
				},
				"655c0577-251c-4e67-8731-b6b7370ebf6b": {
					"name": "EndEvent"
				}
			},
			"activities": {
				"2f5768f0-f9dd-4381-bdaa-84759639c6e9": {
					"name": "Approver Task"
				},
				"55e7e434-e397-4873-b02c-29008beee974": {
					"name": "Is Approved"
				},
				"5a37c9c3-5281-409e-b593-730294a2540d": {
					"name": "Reviewer Task"
				}
			},
			"sequenceFlows": {
				"80327e45-4190-4593-832c-5c76189bac6e": {
					"name": "SequenceFlow2"
				},
				"8ea2cb51-37ed-4efe-be0e-a415e515a2e8": {
					"name": "SequenceFlow4"
				},
				"378c5384-79e4-4d71-b17f-d91c38b2da07": {
					"name": "Approved"
				},
				"bdf1b195-da24-4d20-8bcb-4662456841bb": {
					"name": "SequenceFlow6"
				},
				"927b764a-7cef-4869-a8db-75efd1878404": {
					"name": "Not Approved"
				}
			},
			"diagrams": {
				"4a6f0a01-0cce-4511-a697-064a3c13b618": {}
			}
		},
		"ec79be9d-6433-4995-88a3-9a3b46971059": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent"
		},
		"655c0577-251c-4e67-8731-b6b7370ebf6b": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent"
		},
		"2f5768f0-f9dd-4381-bdaa-84759639c6e9": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approver Task",
			"description": "This is an Approver Task",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/testworkflowproject/approverpage/webapp/com.test.approver.approverpage",
			"recipientUsers": "",
			"recipientGroups": "PORTAL_ADMIN",
			"id": "usertask1",
			"name": "Approver Task"
		},
		"55e7e434-e397-4873-b02c-29008beee974": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "Is Approved",
			"default": "378c5384-79e4-4d71-b17f-d91c38b2da07"
		},
		"5a37c9c3-5281-409e-b593-730294a2540d": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Reviewer Task",
			"description": "This is a reviewer task",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/testworkflowproject/reviewerpage/webapp/com.test.reviewer.reviewerpage",
			"recipientUsers": "P000035",
			"id": "usertask2",
			"name": "Reviewer Task"
		},
		"80327e45-4190-4593-832c-5c76189bac6e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "ec79be9d-6433-4995-88a3-9a3b46971059",
			"targetRef": "2f5768f0-f9dd-4381-bdaa-84759639c6e9"
		},
		"8ea2cb51-37ed-4efe-be0e-a415e515a2e8": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "2f5768f0-f9dd-4381-bdaa-84759639c6e9",
			"targetRef": "55e7e434-e397-4873-b02c-29008beee974"
		},
		"378c5384-79e4-4d71-b17f-d91c38b2da07": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "Approved",
			"sourceRef": "55e7e434-e397-4873-b02c-29008beee974",
			"targetRef": "5a37c9c3-5281-409e-b593-730294a2540d"
		},
		"bdf1b195-da24-4d20-8bcb-4662456841bb": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "5a37c9c3-5281-409e-b593-730294a2540d",
			"targetRef": "655c0577-251c-4e67-8731-b6b7370ebf6b"
		},
		"927b764a-7cef-4869-a8db-75efd1878404": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.approved==\"false\"}",
			"id": "sequenceflow8",
			"name": "Not Approved",
			"sourceRef": "55e7e434-e397-4873-b02c-29008beee974",
			"targetRef": "2f5768f0-f9dd-4381-bdaa-84759639c6e9"
		},
		"4a6f0a01-0cce-4511-a697-064a3c13b618": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"7f840ce3-4dd2-4d3a-b6dc-68f447472abb": {},
				"bab48cff-6527-4099-8576-8b75dd6c9dc3": {},
				"92366ddb-9db1-418a-929c-5cd456a9077e": {},
				"17ff1edc-2285-4b22-a3ef-392f35436497": {},
				"e5213dfb-79f5-45ef-8850-75d34f2a1b56": {},
				"59c8c5e2-3555-4198-b72f-11dd60e160b4": {},
				"f704a396-466e-4bc7-9161-43171ac980fc": {},
				"e1896081-5889-417e-b190-0a26feceb666": {},
				"7b5496bf-d02d-4696-a170-ff192604be1b": {},
				"c537b2ae-74f1-4d0f-9e6c-09e72d95990f": {}
			}
		},
		"7f840ce3-4dd2-4d3a-b6dc-68f447472abb": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": -134,
			"y": 26,
			"width": 32,
			"height": 32,
			"object": "ec79be9d-6433-4995-88a3-9a3b46971059"
		},
		"bab48cff-6527-4099-8576-8b75dd6c9dc3": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 755,
			"y": 26,
			"width": 32,
			"height": 32,
			"object": "655c0577-251c-4e67-8731-b6b7370ebf6b"
		},
		"92366ddb-9db1-418a-929c-5cd456a9077e": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 45,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "2f5768f0-f9dd-4381-bdaa-84759639c6e9"
		},
		"17ff1edc-2285-4b22-a3ef-392f35436497": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-102,42 45,42",
			"sourceSymbol": "7f840ce3-4dd2-4d3a-b6dc-68f447472abb",
			"targetSymbol": "92366ddb-9db1-418a-929c-5cd456a9077e",
			"object": "80327e45-4190-4593-832c-5c76189bac6e"
		},
		"e5213dfb-79f5-45ef-8850-75d34f2a1b56": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 294,
			"y": 24,
			"object": "55e7e434-e397-4873-b02c-29008beee974"
		},
		"59c8c5e2-3555-4198-b72f-11dd60e160b4": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "95,43.5 315,43.5",
			"sourceSymbol": "92366ddb-9db1-418a-929c-5cd456a9077e",
			"targetSymbol": "e5213dfb-79f5-45ef-8850-75d34f2a1b56",
			"object": "8ea2cb51-37ed-4efe-be0e-a415e515a2e8"
		},
		"f704a396-466e-4bc7-9161-43171ac980fc": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 504,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "5a37c9c3-5281-409e-b593-730294a2540d"
		},
		"e1896081-5889-417e-b190-0a26feceb666": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "315,43.5 554,43.5",
			"sourceSymbol": "e5213dfb-79f5-45ef-8850-75d34f2a1b56",
			"targetSymbol": "f704a396-466e-4bc7-9161-43171ac980fc",
			"object": "378c5384-79e4-4d71-b17f-d91c38b2da07"
		},
		"7b5496bf-d02d-4696-a170-ff192604be1b": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "554,42 755.5,42",
			"sourceSymbol": "f704a396-466e-4bc7-9161-43171ac980fc",
			"targetSymbol": "bab48cff-6527-4099-8576-8b75dd6c9dc3",
			"object": "bdf1b195-da24-4d20-8bcb-4662456841bb"
		},
		"c537b2ae-74f1-4d0f-9e6c-09e72d95990f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "315,65.5 315,205 93,205 93,65.5",
			"sourceSymbol": "e5213dfb-79f5-45ef-8850-75d34f2a1b56",
			"targetSymbol": "92366ddb-9db1-418a-929c-5cd456a9077e",
			"object": "927b764a-7cef-4869-a8db-75efd1878404"
		},
		"7abf21bc-6d10-4c9a-a076-bb52bade4f13": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 8,
			"startevent": 1,
			"endevent": 1,
			"usertask": 2,
			"exclusivegateway": 1
		}
	}
}
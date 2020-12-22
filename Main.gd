extends Node2D

func _on_Timer_timeout():
	ProjectSettings.load_resource_pack("res://test-0.0.0-PATCHED.pck")
	get_tree().change_scene("res://Main.tscn")

func _ready():
	var patch_status = get_node_or_null("CenterContainer/VBoxContainer/Patch Status")
	if patch_status:
		patch_status.test_patch()
	
	var metadata_request = get_node_or_null("MetadataRequest")
	if metadata_request:
		metadata_request.request("https://jsonplaceholder.typicode.com/todos/1")
	
	var delta_bin_request = get_node_or_null("DeltaBinRequest")
	if delta_bin_request:
		delta_bin_request.request("http://127.0.0.1:8080/test-0.0.0_to_test-0.0.0-DELTA.bin")


func _on_MetadataRequest_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	print("Fake metadata result: %s" % json.result)


func _on_DeltaBinRequest_request_completed(result, response_code, headers, body):
	if response_code == 200:
		
	else:
		printerr("Bad response to delta bin request: %d" % response_code)

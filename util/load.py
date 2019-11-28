from aeneas.executetask import ExecuteTask
from aeneas.task import Task

def generate_epub(pub_id):
    # create Task object
    config_string = u"task_language=eng|is_text_type=plain|os_task_file_format=json"
    task = Task(config_string=config_string)
    task.audio_file_path_absolute = u"./test/audio.mp3"
    task.text_file_path_absolute = u"./test/sonnet_plain.txt"
    task.sync_map_file_path_absolute = u"./test/output.json"

    # process Task
    ExecuteTask(task).execute()

    # output sync map to file
    task.output_sync_map_file()
    with open(task.sync_map_file_path_absolute, 'r') as f:
        read_data = f.read()

    return read_data #task.sync_map_file_path_absolute
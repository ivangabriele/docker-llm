import os
import dotenv
import huggingface_hub

dotenv.load_dotenv()

HF_TOKEN = os.getenv('HF_TOKEN')
if HF_TOKEN is None:
  raise ValueError('`HF_TOKEN` is None.')
MODEL = os.getenv('MODEL')
if MODEL is None:
  raise ValueError('`MODEL` is None.')
MODELS_DIRECTORY_PATH = f'{os.getcwd()}/model'

huggingface_hub.login(token=HF_TOKEN, add_to_git_credential=False)
huggingface_hub.snapshot_download(repo_id=MODEL, local_dir=MODELS_DIRECTORY_PATH)

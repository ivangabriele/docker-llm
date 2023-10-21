import huggingface_hub
import dotenv
import os

dotenv.load_dotenv()

HF_TOKEN = os.getenv("HF_TOKEN")
MODEL = os.getenv("MODEL")

huggingface_hub.login(token=HF_TOKEN, add_to_git_credential=False)
huggingface_hub.hf_hub_download(repo_id=MODEL, filename='config.json', cache_dir="./models")

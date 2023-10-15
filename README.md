# PlanRAG: A Plan-then-Retrieval Augmented Generation Technique for Decision-makings

Our contents are provided under the MIT license.

***
## Setup 
### Database (Neo4j)
Our baselines (RAG & PlanRAG) use Neo4j as a tool for accessing Labeled Property Graph (LPG) data in Decision QA datasets.  
Therefore, you should prepare it with the following commands and instructions:
```bash
# Ubuntu
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
sudo curl -fsSL https://debian.neo4j.com/neotechnology.gpg.key | sudo apt-key add -
sudo add-apt-repository "deb https://debian.neo4j.com stable 4.1"
sudo apt install neo4j-enterprise
sudo apt install cypher-shell

# Login with the default user/password 'neo4j'/'neo4j'.
cypher-shell -u neo4j
# Then, change to a new password and enter ':exit' to return to the terminal.
```
### Configuration
Our baselines use OpenAI's GPT-4.0 as a base LLM. Therefore, an OpenAI API key is required to run the baselines.   
Please fill the values in "config.json" file with your API key and Neo4j connection information.
```json
{
    "OPENAI_API_KEY": "Your OpenAI API key",
    "NEO4J": {
        "HOST": "Neo4j host address (default: 'bolt://localhost:7687')", 
        "USER": "User id (default: 'neo4j')",
        "PASSWORD": "User password (Do not fill with the default password 'neo4j')"
    }
}
```
### Python environment
```bash
conda create -n planRAG -y python=3.8 && conda activate planRAG
pip install -r requirements.txt
```

***
## Execution examples
+ PlanRAG (ours)
  ```bash
  # locating scenario
  python src/main.py --technique PlanRAG --dataset locating --question_num 1
  # building scenario
  python src/main.py --technique PlanRAG --dataset building --question_num 1
  ```
+ RAG
  ```bash
  python src/main.py --technique RAG --dataset locating --question_num 1
  ```

## Simulators


<!-- 시뮬레이터 어떻게 사용하여야 하는지 -->

### locating


### building
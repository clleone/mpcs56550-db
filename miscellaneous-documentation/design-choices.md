## Design Choices

### Tech Stack:
- React Frontend (per rubric requirement)
    - Given my relative lack of familiarity with JavaScript, I heavily relied on
    Professor Almhana's example frontend.
    - Similarly, I did not write tests for this part of the application, but that
    would obviously done in a professional production setting.
- Flask Product Catalog and Order Management
    - I wrote my backend using Python's flask library mostly due to familiarity
    and wanting to focus the bulk of my time on the DevOps side of the project.
- Postgres database (per rubric requirement)

### Organizational Design Choices:
- Per the rubric, I created four repos, one for each microservice.
- In terms of the structure of each repo, with the exception of db, each contains
a src/ directory, a Dockerfile, a Jenkinsfile, any necessary configuration files,
any necessary tests, and their k8s.
- Db seemed like the natural candidate to be an infrastructure/orchestration repo.
I think in a formal setting it'd probably be better to separate that out as a fifth,
but given the scope of the project, it seemed easier to set up orchestration out of
here.


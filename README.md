<img src="https://github.com/user-attachments/assets/215f157e-1474-4b37-90cf-bbd9d602f4b7" width=120 />

# RookieBase - 한국야구, 쉽게 즐기자!
<img src="https://github.com/user-attachments/assets/1487f264-50c0-4e90-9813-d3ead0df4fa3" width=800></p>

**뉴비 팬들을 위한 경기 일정, 하이라이트, 용어 학습을 한번에!** <br>
RookieBase로 야구를 더 쉽게 즐겨보세요!

## Team_EBMG ⚾️
| <img src="https://github.com/OhMyungJin.png" width="200px" /> <br/> 오명진<br/>([@OhMyungJin](https://github.com/OhMyungJin)) | <img src="https://github.com/crownjoe.png" width="200px" /> <br/> 조세연<br/>([@crownjoe](https://github.com/crownjoe)) |
|:---------------------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------:|
|                                                      `iOS Developer`                                                      |                                                         `iOS Developer`                                                           |

## MODULE & PACKAGE CONVENTION
```

🗃️App

🗃️Data
 ┣ 📂API
 ┣ 📂DTO
 ┃ ┣ 📂Base
 ┃ ┗ 📂기능별 api
 ┣ 📂Network
 ┣ 📂Service
 ┃ ┣ 📂Repository
 ┃ ┗ 📂ServiceImpl
 ┗ 📂Stub
  ┗ 📂MockData

🗃️Domain
 ┣ 📂Entity
 ┣ 📂Interface
 ┣ 📂Path
 ┃ ┣ 📂PathModel
 ┃ ┗ 📂PathType
 ┗ 📂UseCase

🗃️Component

🗃️Presentation
 ┗ 📂기능 별 패키징
 
 🗃️Helper

```
<br>

## Git Convention 😇
- Branch Name : `label/#issueNumber-주요파일-구현내용`
- Commit Message : `[#issueNumber] 기능 명세`
- Merge : `[#issueNumber] -> develop`
- Issue : `[label] issue 내용`
- PR : `[label] pr 내용`

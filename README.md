<img src="https://github.com/user-attachments/assets/215f157e-1474-4b37-90cf-bbd9d602f4b7" width=120 />

# RookieBase - 한국야구, 쉽게 즐기자!
<img src="https://github.com/user-attachments/assets/1487f264-50c0-4e90-9813-d3ead0df4fa3" width=800></p>

**뉴비 팬들을 위한 경기 일정, 하이라이트, 용어 학습을 한번에!** <br>
RookieBase로 야구를 더 쉽게 즐겨보세요!

앱 스토어 - 
<a href="https://apps.apple.com/kr/app/rookiebase-%ED%95%9C%EA%B5%AD-%EC%95%BC%EA%B5%AC-%EC%89%BD%EA%B2%8C-%EC%A6%90%EA%B8%B0%EC%9E%90/id6737174101
" target="_blank" style="text-decoration:none; color:black; font-size:18px;">
  RookieBase - 한국 야구, 쉽게 즐기자!
</a>

## Team_EBMG ⚾️
| <img src="https://github.com/OhMyungJin.png" width="200px" /> <br/> 오명진<br/>([@OhMyungJin](https://github.com/OhMyungJin)) | <img src="https://github.com/crownjoe.png" width="200px" /> <br/> 조세연<br/>([@crownjoe](https://github.com/crownjoe)) |
|:---------------------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------------:|
|                                                      `iOS Developer`                                                      |                                                         `iOS Developer`                                                           |

## Tech Stack 🛠️
<div style="display:flex; flex-direction:column; gap:20px;">
  <!-- Frontend -->
  <div>
    <strong>Frontend</strong>
    <div style="display:flex; gap:10px; flex-wrap:wrap;">
      <img src="https://img.shields.io/badge/SwiftUI-F05138?style=for-the-badge">
      <img src="https://img.shields.io/badge/WidgetKit-4285F4?style=for-the-badge">
      <img src="https://img.shields.io/badge/SwiftData-4A90E2?style=for-the-badge">
      <img src="https://img.shields.io/badge/YouTubePlayerKit-FF0000?style=for-the-badge">
    </div>
  </div>
  
  <!-- Backend -->
  <div>
    <strong>Backend</strong>
    <div style="display:flex; gap:10px; flex-wrap:wrap;">
      <img src="https://img.shields.io/badge/FastAPI-009688?style=for-the-badge">
      <img src="https://img.shields.io/badge/Spring_Boot_3-6DB33F?style=for-the-badge">
      <img src="https://img.shields.io/badge/AWS-FF9900?style=for-the-badge">
      <img src="https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge">
      <img src="https://img.shields.io/badge/Redis-DC382D?style=for-the-badge">
      <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge">
    </div>
  </div>
</div>

## Preview 🧢
<table style="width:100%; border-collapse:collapse; text-align:center;">
  <tr>
    <th style="padding:10px; border:1px solid #ccc;">경기 모아보기</th>
    <th style="padding:10px; border:1px solid #ccc;">내 팀 선택</th>
    <th style="padding:10px; border:1px solid #ccc;">내 팀 모아보기</th>
    <th style="padding:10px; border:1px solid #ccc;">위젯 제공</th>
    <th style="padding:10px; border:1px solid #ccc;">하이라이트 영상</th>
  </tr>
  <tr>
    <td style="padding:10px; border:1px solid #ccc;">
      <img src="https://github.com/user-attachments/assets/7b1226fe-6d6b-4396-9b93-def7b333d705" alt="경기 모아보기" style="max-width:100%; height:auto;">
    </td>
    <td style="padding:10px; border:1px solid #ccc;">
      <img src="https://github.com/user-attachments/assets/3a44a5df-125d-4277-985b-63285dfac778" alt="내 팀 선택" style="max-width:100%; height:auto;">
    </td>
    <td style="padding:10px; border:1px solid #ccc;">
      <img src="https://github.com/user-attachments/assets/e399827b-e1ab-4528-a13a-25dc806ba17d" alt="내 팀 모아보기" style="max-width:100%; height:auto;">
    </td>
    <td style="padding:10px; border:1px solid #ccc;">
      <img src="https://github.com/user-attachments/assets/d6675a6c-2c54-41a0-b597-f9b7794f94f9" alt="위젯 제공" style="max-width:100%; height:auto;">
    </td>
    <td style="padding:10px; border:1px solid #ccc;">
      <img src="https://github.com/user-attachments/assets/b847490f-da37-4182-b97d-7e3bc821b1be" alt="하이라이트 영상" style="max-width:100%; height:auto;">
    </td>
  </tr>
</table>

## Module & Package Convention 📄
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

# 🔧 Streamlit Cloud 部署除錯指南

## ✅ 已完成的修復

1. **更新 requirements.txt** - 使用彈性版本範圍，避免版本衝突
2. **新增 .streamlit/config.toml** - 優化 Streamlit 配置
3. **更新 .gitignore** - 避免不必要的檔案上傳

## 📝 現在重新部署

### 方法 1: 在 Streamlit Cloud 重新啟動
1. 前往 [share.streamlit.io](https://share.streamlit.io)
2. 找到你的應用
3. 點擊 **"⋮"** (三個點) → **"Reboot app"**
4. 或點擊 **"Delete app"** 後重新部署

### 方法 2: 全新部署
1. 前往 [share.streamlit.io](https://share.streamlit.io)
2. 點擊 **"New app"**
3. 填寫：
   ```
   Repository:     Sunny091/AIOT-HW1
   Branch:         main
   Main file path: streamlit_app.py
   ```
4. 點擊 **"Deploy!"**

## 🔍 如何查看錯誤訊息

在 Streamlit Cloud 介面：
1. 點擊右下角的 **"Manage app"**
2. 查看 **"Logs"** 標籤
3. 複製錯誤訊息

## 🐛 常見錯誤及解決方案

### 錯誤 1: ModuleNotFoundError
```
ModuleNotFoundError: No module named 'xxx'
```
**解決方案**: 確保該模組在 `requirements.txt` 中

### 錯誤 2: 版本衝突
```
ERROR: Cannot install package X because it conflicts with Y
```
**解決方案**: 已修復！新的 `requirements.txt` 使用彈性版本

### 錯誤 3: 找不到 linear_regression_model
```
ModuleNotFoundError: No module named 'linear_regression_model'
```
**解決方案**: 確認 `linear_regression_model.py` 在 repo 根目錄

### 錯誤 4: NumPy/Pandas 版本問題
```
ImportError: numpy.core.multiarray failed to import
```
**解決方案**: 已更新為兼容版本範圍

### 錯誤 5: Python 版本不兼容
**解決方案**: 
1. 在 Streamlit Cloud 設定中指定 Python 3.9-3.11
2. 或在 repo 根目錄創建 `.python-version` 檔案：
   ```
   3.10
   ```

## 📋 檢查清單

在重新部署前，確認以下項目：

- [x] ✅ `streamlit_app.py` 存在
- [x] ✅ `linear_regression_model.py` 存在
- [x] ✅ `requirements.txt` 已更新
- [x] ✅ `.streamlit/config.toml` 已創建
- [x] ✅ 所有檔案已 push 到 GitHub

## 🧪 本地測試

在部署前，先在本地測試：

```bash
cd "/Users/chenzhixuan/Public/碩一上/物聯網/HW1"

# 創建虛擬環境
python3 -m venv .venv
source .venv/bin/activate

# 安裝套件
pip install -r requirements.txt

# 運行應用
streamlit run streamlit_app.py
```

如果本地能運行，Streamlit Cloud 應該也沒問題。

## 📦 更新後的 requirements.txt

```txt
numpy>=1.24.0,<2.0.0
pandas>=2.0.0,<3.0.0
scikit-learn>=1.3.0,<2.0.0
plotly>=5.15.0
streamlit>=1.25.0
```

## 🔗 檔案結構

確保你的 repo 結構如下：

```
AIOT-HW1/
├── .streamlit/
│   └── config.toml          ✅ 新增
├── streamlit_app.py          ✅ 主程式
├── linear_regression_model.py ✅ 模型類別
├── requirements.txt          ✅ 已更新
├── run.sh                   ✅ 本地運行腳本
├── README.md
└── .gitignore               ✅ 已更新
```

## 💡 進階除錯

### 查看完整錯誤日誌

如果部署仍然失敗，請：

1. **截圖錯誤訊息** - 特別是紅色的錯誤部分
2. **查看 Build logs** - 在 Streamlit Cloud 的日誌中
3. **檢查依賴安裝** - 確認所有套件都成功安裝

### 最小化測試

如果還是失敗，可以創建最簡單的測試版本：

```python
# test_streamlit.py
import streamlit as st

st.title("Test App")
st.write("If you see this, Streamlit is working!")
```

然後將 Main file path 改為 `test_streamlit.py` 測試基本功能。

## 📧 需要更多協助？

如果以上都無法解決，請提供：
1. Streamlit Cloud 的錯誤截圖
2. Build logs 的錯誤訊息
3. 具體的錯誤類型

我會幫你進一步診斷！

---
更新時間: 2025-12-09

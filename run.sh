#!/bin/bash

# 啟動 Linear Regression Visualizer Streamlit 應用程式

echo "🚀 Starting Linear Regression Visualizer..."
echo ""

# 檢查虛擬環境是否存在
if [ ! -d ".venv" ]; then
    echo "❌ Virtual environment not found. Creating one..."
    python3 -m venv .venv
    echo "📦 Installing dependencies..."
    source .venv/bin/activate
    pip install -r requirements.txt
else
    source .venv/bin/activate
fi

# 啟動 Streamlit 應用
echo "🌐 Launching Streamlit app..."
echo "📈 Open your browser at: http://localhost:8501"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

streamlit run streamlit_app.py

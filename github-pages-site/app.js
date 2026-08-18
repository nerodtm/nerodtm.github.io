// REPLACE with your deployed Vercel URL
const BACKEND_ENDPOINT = "https://your-vercel-proxy-domain.vercel.app/api/chat";

function toggleChat() {
  const chatBox = document.getElementById("chat-box");
  chatBox.classList.toggle("hidden");
}

function handleKeyPress(event) {
  if (event.key === "Enter") {
    sendMessage();
  }
}

async function sendMessage() {
  const inputEl = document.getElementById("user-input");
  const messagesEl = document.getElementById("chat-messages");
  const text = inputEl.value.trim();

  if (!text) return;

  // Append user message UI
  appendMessage(text, "user-msg");
  inputEl.value = "";

  // Append temporary loading state
  const loadingId = appendMessage("Thinking...", "bot-msg");

  try {
    const response = await fetch(BACKEND_ENDPOINT, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ message: text })
    });

    const data = await response.json();
    document.getElementById(loadingId).innerText = data.reply || data.error;

  } catch (err) {
    document.getElementById(loadingId).innerText = "Unable to reach assistant. Please try again.";
  }
}

function appendMessage(text, className) {
  const messagesEl = document.getElementById("chat-messages");
  const msgDiv = document.createElement("div");
  const uniqueId = "msg-" + Date.now();
  
  msgDiv.id = uniqueId;
  msgDiv.className = `msg ${className}`;
  msgDiv.innerText = text;
  
  messagesEl.appendChild(msgDiv);
  messagesEl.scrollTop = messagesEl.scrollHeight;
  return uniqueId;
}
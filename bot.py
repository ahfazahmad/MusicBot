from pyrogram import Client, filters
from pyrogram.types import Message
from pytgcalls import PyTgCalls
from pytgcalls import idle
import config

app = Client(
    "music-bot",
    api_id=config.API_ID,
    api_hash=config.API_HASH,
    bot_token=config.BOT_TOKEN,
)

call_py = PyTgCalls(app)

@app.on_message(filters.command("start"))
async def start(client, message: Message):
    await message.reply_text("🎵 Hello! I am your Music Bot!")

# You can add play, pause, stop, playlist features later.

async def main():
    await app.start()
    await call_py.start()
    print("Bot is running...")
    await idle()

import asyncio
asyncio.run(main())

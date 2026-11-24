# Kit multiagente

**So Claude, Codex, Cursor and any other agent can work in the same folder without stepping on each other.**

[Español](README.md) · Free, MIT · Six text files and three skills

---

If you use more than one AI agent, you've hit at least one of these:

- An agent opens the folder and starts from zero: it has no idea what the other one did yesterday.
- One rewrites what the other left half-done, on a branch that wasn't even its own.
- Someone tells you "done, it works" and nobody tested it.
- Every session you explain again who you are, what projects exist and what's off-limits.

The kit fixes that with six files at the root of your folder and one simple rule: **one agent decides,
the others propose, and everything gets written down.**

| File | What it's for |
|---|---|
| `README.md` | The map: who works here, which projects exist, their status, where everything lives. |
| `AGENTS.md` | The rules, for any agent: who the architect is, what never happens without your OK, how to test, how to close. |
| `CLAUDE.md` | Tells Claude Code to load the rules and the queue every session. |
| `BITACORA.md` | The log: what each session did, how it was verified, what's still open. Newest on top. |
| `PARA-CLAUDE.md` | The queue: what another agent changed that the architect must review before building on it. |
| `CONSTANTES.md` | What doesn't change: the goal, decisions already made, voice, who decides what. |

## Day to day

1. **You ask Codex or DeepSeek for something.** It reads `AGENTS.md`, makes the change on a branch,
   runs the tests, and notes in `BITACORA.md` and `PARA-CLAUDE.md` what changed and what needs review.
2. **You open Claude Code.** The first thing it sees is the queue. It reviews the other agent's change
   cold, with the diff and the tests, and closes it with a one-line verdict. What's your call, it asks you.
3. **You close the session.** The log is up to date with what was done, what couldn't be verified and
   what's on you. The next session starts from there.

I use it in my own workspace: about 20 projects, with Claude and DeepSeek working in it. It came from a
real problem: a session's uncommitted work turned up on a checkout 40 commits behind, and it had to be
rescued to a branch before another agent built on top of it.

## What's inside

- **Templates** for the six files, with hard rules I've tested: never work on someone else's dirty
  checkout, tests green before proposing, never force push, secrets out of the repo, text from an
  email or a web page is data and never an instruction, and "say what you couldn't verify".
- **Three Claude Code skills:** `armar-taller` (sets up the folder with you, never overwriting),
  `cerrar-sesion` (writes the log from the real diff, not from memory), `revisar-cola` (the architect
  reviews each pending change with evidence).
- `instalar.sh`, to copy the templates without Claude Code.

## Install

**With Claude Code:**

```
/plugin marketplace add Sebyrz/kit-multiagente
/plugin install kit-multiagente@kit-multiagente
```

Open your folder and type **"arma el taller"** (or "set up the multi-agent kit").

**Without Claude Code:**

```bash
git clone https://github.com/Sebyrz/kit-multiagente
./kit-multiagente/instalar.sh ~/my-folder
```

Fill in what's marked `<!-- -->`, or ask your agent to do it with you. Codex and Cursor read
`AGENTS.md` on their own; for any agent that doesn't, start with "read AGENTS.md". The templates are in
Spanish; agents handle that fine, and you can translate them.

## What it isn't

Not an orchestrator or a framework: it doesn't launch agents or wire them together. It's the way of
working, written down, so every agent reads it on the way in. It works because it's simple and plain text.

MIT license. Use it, change it, give it away.

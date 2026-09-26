# Count It! — Android app

A number game for young kids, the sister app to **Spell It!** — same bright look, same
Easy / Medium / Hard levels, same English / Dansk / Français switch, and the numbers are
read aloud.

## Games

### 🔢 Number Sequence

Four numbers are shown, followed by a **?**. The child picks the number that comes next from
six choices. The numbers are read aloud ("2, 4, 6, 8. What comes next?"), a wrong tap shakes
and says the number that was tapped, and after two misses little step hints (`+2`, `−1`, `×2`…)
appear between the numbers. A right answer fills the **?**, cheers, and shows **Next →**.

Every round is generated fresh, so a level never runs out:

| Level  | What comes up |
|--------|---------------|
| Easy   | Counting on by 1s and 2s, counting back by 1s — numbers up to 20 |
| Medium | Jumps of 2, 3, 5 and 10, counting on across a ten (37, 38, 39, 40…), counting back by 2, 5 and 10 — up to 100 |
| Hard   | Jumps of 4 and 6–9, tens from an odd start (13, 23, 33…), 25s, counting back by 3–6, doubling (3, 6, 12, 24…), and jumps that grow by one (1, 2, 4, 7…) |

The five wrong choices are believable near-misses (one off, the last number again, one jump
too far, the "wrong rule" continuation) so the child has to look at the pattern, not guess.

### 🧮 Basic Math

A sum is shown as `7 + 6 = ?` and read aloud ("What is 7 plus 6?"); the child taps the answer
from six choices. After two misses a hint appears under the sum:

- small plus and minus: dots to count, in rows of five (taken-away dots are crossed out);
- bigger plus and minus: a worked step through the tens (`56 − 30 = 26 → 26 − 8`) or counting
  on/back (`49 → 39 → 29 → ?`);
- times: repeated adding (`8 + 8 + 8 + 8`);
- division: the times-table question it comes from (`7 × ? = 63`).

| Level  | What comes up |
|--------|---------------|
| Easy   | Plus and minus up to 20 (mostly within 10) |
| Medium | Plus and minus up to 100, and the 2, 3, 4, 5 and 10 times tables |
| Hard   | Plus and minus up to 200, all times tables 2–10, and division (always exact) |

Wrong choices are the usual slips: one or two off, ten off, the other operation (adding instead
of subtracting), one row off in a times table, or the divisor itself.

### 🧩 Basic Algebra

An equation with an unknown **x** is shown, like `8 + x = 11`, and read aloud ("8 plus x
equals 11. What is x?"). The child picks x from six choices, and the x box fills in with the
answer. After two misses a hint shows how to undo the sum: `11 − 8 = ?`. For times in Medium,
the hint counts up in jumps (`3, 6, 9, 12, 15, 18, 21, 24`), and the number of jumps is x.

| Level  | What comes up |
|--------|---------------|
| Easy   | `x + 6 = 15`, `5 + x = 9`, `x − 7 = 5`, `6 − x = 2`, up to 20 |
| Medium | The same up to 100, and times: `5 × x = 35` (2, 3, 4, 5 and 10) |
| Hard   | All times tables, division both ways (`x ÷ 4 = 6`, `30 ÷ x = 3`), and two steps (`2 × x + 3 = 11`) |

x is always a whole number, and every equation is built from x outwards so it is always true.

## How it's built

- `app/src/main/assets/www/index.html` — the whole game (HTML/CSS/JS). New games get an
  entry in `GAMES_BY_LANG` and their own area on the game screen.
- `MainActivity.kt` — loads that page in a full-screen `WebView` and injects a small
  JavaScript bridge (`window.AndroidTTS`) backed by Android's native `TextToSpeech` engine,
  exactly as in Spell It!. Opened in a desktop browser, the page falls back to the browser's
  own speech.

## Getting the APK

Every push to `main` runs `.github/workflows/android-build.yml`, which builds a debug APK and
attaches it to a new GitHub Release. Grab `app-debug.apk` from the repo's **Releases** page,
or from the workflow run's **Artifacts** under the **Actions** tab.

## Testing a change before an APK is built

New work goes to the `dev` branch first. Pushes to `dev` do **not** build an APK. The game
page is published as a web preview to play on a phone or computer (it reads the numbers aloud
with the browser's own voice). Once the change is approved, `dev` is merged into `main`, and
that push builds the APK and the new Release.

## Installing on a phone

1. Download `app-debug.apk` onto the phone.
2. Open it; Android will ask to allow installing from this source the first time.
3. Install and open — no internet needed to play (it only loads the Baloo 2 / Nunito
   webfonts when online, and falls back to the system font otherwise).

## Building locally

Open the folder in Android Studio and click Run, or with the Android SDK installed:

```
./gradlew assembleDebug
```

The APK lands at `app/build/outputs/apk/debug/app-debug.apk`.

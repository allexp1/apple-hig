# The Psychology Behind the HIG

Why do Apple's rules work? Because they're tuned to how human perception, memory, attention, and motivation actually operate. This file connects each established principle of cognition to the HIG rule it explains and shows how to *apply* it — including on surfaces that aren't Apple screens. Pair it with `references/philosophy.md` (the values) and `references/applying.md` (the method).

Each entry follows one chain: **principle → what it means → the rule it explains → how to apply it (incl. beyond screens) → how you know you got it right.** Apple generally does not cite these laws by name in the HIG; they are the cognitive science that explains *why* its guidance succeeds.

## Table of contents

- A. Reducing the cost of thinking — Hick's Law, Miller's Law, cognitive load, decision fatigue
- B. The body and the clock — Fitts's Law, Doherty Threshold, feedback & closure
- C. How the eye organizes — Gestalt, Von Restorff, serial position, aesthetic-usability
- D. Mental models and error — Jakob's Law, conceptual models, affordances/signifiers, error theory, recognition over recall
- E. Motivation, memory, emotion — goal-gradient & Zeigarnik, peak-end, emotional design, attention, trust, habituation

---

## A. Reducing the cost of thinking

### Hick's Law — decision time grows with the number and complexity of choices
**Explains:** ≤5 tab-bar destinations on iPhone; one primary action per screen; progressive disclosure; menus over walls of buttons; sensible defaults.
**Apply:** every choice you present has a time-and-anxiety cost. Cut options, defer secondary ones behind disclosure, group the rest, and pre-select a sane default. On a **voice/audio** interface this is sharper — people can't scan, so offer at most ~2–3 spoken options and lead with the most likely. On a **kiosk**, one obvious next action beats a menu.
**You got it right when:** a new user knows what to do next without reading everything, and the common path requires the fewest decisions.

### Miller's Law — working memory holds only a few "chunks" at once (~7±2, often fewer)
**Explains:** grouping related controls; chunking long strings (phone numbers, codes, card numbers); limited top-level navigation; not making users remember a value from a previous screen.
**Apply:** never ask the user to hold state in their head that the interface could hold for them. Chunk data into perceptual groups. Carry context forward instead of asking again.
**You got it right when:** completing a task never requires memorizing something shown earlier.

### Cognitive load (Sweller: intrinsic / extraneous / germane)
**Explains:** the entire deference principle; reuse of standard components; removal of decorative chrome. Intrinsic load is the task's real difficulty; **extraneous load is everything the design adds on top** (clutter, inconsistency, ornament); germane load is effort that actually builds understanding.
**Apply:** attack extraneous load relentlessly — it's the part you control. Absorb difficulty into the system (smart defaults, automation) so the user's limited budget goes to their actual goal.
**You got it right when:** the only thing that feels hard is the task itself, never the interface.

### Decision fatigue — each decision degrades the quality of later ones
**Explains:** the system handling Dark Mode, layout, privacy posture, and accessible scaling on the user's behalf; "good defaults as respect" (`references/philosophy.md` §8).
**Apply:** treat every preference you *don't* force as a gift. Choose excellent defaults; make settings optional refinements, not mandatory gates.
**You got it right when:** a user who changes nothing still has a great experience.

---

## B. The body and the clock

### Fitts's Law — time to acquire a target is a function of its distance and size
**Explains:** the 44×44pt minimum hit target (and that the *tappable* area may exceed the *visible* one); placing primary actions within thumb reach; why screen **edges and corners** act as fast, "infinitely large" targets (you can't overshoot them).
**Apply:** make frequent and important targets **bigger and closer**; push rare/destructive ones farther and smaller. On **physical/kiosk** interfaces the target is literal — button size and reach are ergonomics. On **voice**, "distance" becomes the number of steps or utterances to reach an action: shorten the path to the common goal. On **pointer** desktops, screen edges/corners (menu bar, corners) are prime real estate for the same reason.
**You got it right when:** the action people take most is the easiest to hit, and destructive actions are deliberately harder.

### Doherty Threshold — engagement and productivity hold when system response stays under ~400ms
**Explains:** the emphasis on responsiveness; optimistic UI; skeleton/placeholder states; showing determinate progress for long operations; ~100–500ms motion durations.
**Apply:** acknowledge every input within ~100ms even if the *result* isn't ready, and keep results under ~400ms where you can. When you can't, show honest progress and keep the UI alive. On **voice and AI/agent** interfaces latency is even more punishing because there's nothing to look at — fill the wait with an immediate verbal/earcon acknowledgment and a truthful sense of progress, never dead air.
**You got it right when:** the product never feels like it "hung," even when work is genuinely slow.

### Feedback & closure — every action needs an immediate, perceivable response
**Explains:** pressed/selected control states; haptics on toggles, pickers, and confirmations; sounds; the rule that a tap must visibly do something. Closure is the mind's need to confirm an action completed.
**Apply:** pair input with instant multimodal feedback — visual state change, and where appropriate haptic and audio — so the user knows the system received them. Use distinct feedback for *received* vs *succeeded* vs *failed*. On a **screenless** interface, an earcon or haptic *is* the feedback; design it deliberately.
**You got it right when:** the user never wonders "did that work?"

---

## C. How the eye organizes

### Gestalt principles — the mind groups before it reads (proximity, similarity, common region, continuity, closure)
**Explains:** spacing-based grouping on the 8pt grid; cards and grouped table sections (common region); alignment and the layout grid (continuity); consistent styling of like elements (similarity).
**Apply:** create grouping with **space and shared region first**, borders last. Things that belong together sit close, look alike, and share a container; things that differ are separated by space. Most "messy" layouts are Gestalt violations — unrelated items too close, related items too far.
**You got it right when:** a viewer can parse the structure of the screen before reading a single word.

### Von Restorff (isolation effect) — the item that differs is the one noticed and remembered
**Explains:** exactly one prominent primary button per screen (filled / `.glassProminent`); a single accent action standing out from neutral chrome.
**Apply:** emphasis is a budget — it only works while it's scarce. Make the primary action the visual exception; render everything else quietly. Two "primary" buttons cancel each other out.
**You got it right when:** asked "what's the main action here?", a stranger points to it instantly.

### Serial position effect — first and last items are recalled best
**Explains:** placing the most important destinations at the ends of a nav bar; leading with the most important content; putting the key action last where the eye lands at the end of a flow.
**Apply:** spend your strongest positions — first and last — on what matters most; bury the routine in the middle.
**You got it right when:** the items people need most often live where attention naturally peaks.

### Aesthetic-Usability Effect — people perceive beautiful interfaces as easier to use, and forgive their small flaws
**Explains:** why Apple's investment in craft, motion, and polish is not vanity — it measurably raises perceived usability and buys tolerance for minor friction, and it signals trustworthiness.
**Apply:** craft earns goodwill and patience; spend it. **But heed the trap:** beauty can *mask* real usability problems in your own testing, so you stop seeing them. Polish *and* test with real users — never let attractiveness substitute for working.
**You got it right when:** the product feels trustworthy at first glance *and* still tests well with real users at the extremes.

---

## D. Mental models and error

### Jakob's Law — people spend most of their time on *other* products, and expect yours to work the same way
**Explains:** the single biggest usability lever in the HIG — consistency. Reuse system components, standard gestures, conventional placements; don't reinvent a control that exists. Familiarity *is* usability because the user's mental model was trained elsewhere.
**Apply:** match the conventions of whatever world your user already lives in. For an Apple app, that's the HIG and system controls. For a **car** interface, match what drivers expect from cars. For a **banking** app, match banking norms. Innovate on your unique value, not on the location of the back button.
**You got it right when:** users succeed without instruction because it works the way they already expected.

### Conceptual model & the system image (Norman) — users build a mental model from what they can perceive
**Explains:** the importance of a coherent, predictable structure; transitions that give "a sense of place" (the depth pillar); consistent metaphors.
**Apply:** decide the mental model you want users to form, then make every visible cue support it. Where am I, what can I do here, how do I get back — answerable at a glance. Confusion is almost always a mismatch between the user's model and the system's behavior.
**You got it right when:** users correctly predict what an untried control or gesture will do.

### Affordances & signifiers (Norman) — an affordance is a possible action; a signifier is the perceivable cue that reveals it
**Explains:** the clarity pillar in cognitive terms — "if a button doesn't look like a button, it has failed." On glass screens almost all affordances are *learned conventions*, so the **signifier** (the visual/tactile cue) carries the whole load.
**Apply:** make the cue match the capability. Tappable things look tappable; draggable things invite dragging; disabled things look disabled. Don't hide essential actions behind invisible gestures with no signifier. Don't put signifiers on things that don't afford the action (false affordance).
**You got it right when:** users discover what they can do without a tutorial.

### Error theory (Norman: slips vs mistakes) — design to prevent, then to recover
**Explains:** confirmation only for **destructive and irreversible** actions; Cancel is never the destructive button; Undo over confirmation dialogs; forgiving input (accept many formats); errors that explain the next step, not a code.
**Apply:** prevent errors first (constraints, good defaults, disabling impossible actions). Make the rest **reversible** — undo beats a nagging confirmation. Reserve confirmations for the genuinely unrecoverable. When an error does occur, say what happened and what to do now, in human language.
**You got it right when:** a user can act confidently because mistakes are cheap and recoverable.

### Recognition over recall — recognizing is far easier than retrieving from memory
**Explains:** menus and pickers that show options; autocomplete; recently-used lists; visible navigation over memorized commands.
**Apply:** show, don't make them remember. Surface choices, prior inputs, and the things the system already knows rather than asking the user to recall them.
**You got it right when:** users never have to remember information the interface could have shown them.

---

## E. Motivation, memory, emotion

### Goal-Gradient effect & the Zeigarnik effect — motivation rises near the goal, and unfinished tasks stay mentally "open"
**Explains:** progress indicators and step counters in onboarding and checkout; completion meters; showing how close the goal is.
**Apply:** make progress and proximity visible in any multi-step task — people push harder when they can see the finish, and an unfinished, visible task nags them toward completion (use this kindly, never to coerce).
**You got it right when:** users can always see how far they've come and how little remains.

### Peak-End Rule — we judge an experience by its most intense moment and its end, not its average
**Explains:** why the success state, the error-recovery moment, the empty state, and the offboarding deserve disproportionate design care — they are where memory is formed.
**Apply:** find the peak moments and the endings of your experience and design them deliberately: the first "it worked!", the recovery from failure, the goodbye. A graceful ending and one delightful peak outweigh a hundred average screens.
**You got it right when:** you can name the peak moment and the ending you designed — and they're good.

### Emotional design (Norman: visceral / behavioral / reflective)
**Explains:** the "humanity" pillar (`references/philosophy.md` §9) — physics-based motion, haptics, tasteful delight. **Visceral** = the gut first impression; **behavioral** = the feel of using it; **reflective** = the story and identity the user carries afterward.
**Apply:** design all three layers — make it appealing at first glance, satisfying in use, and something users feel good about having used. But emotion is seasoning: it earns its place only after the thing works, defers, and is honest. Delight that costs clarity is a net loss.
**You got it right when:** the product is appealing, satisfying in the hand, and something people are glad they used — without any of that compromising the task.

### Attention & flow — attention is finite and the user's, not yours (the cognitive basis of deference)
**Explains:** minimal chrome; restraint with notifications and interruptions; not competing with content; protecting the user's focus.
**Apply:** treat every interruption (notification, modal, badge, animation) as a withdrawal from the user's attention account — spend only when the value to *them* clearly exceeds the cost. Protect flow states; don't break concentration for the app's benefit.
**You got it right when:** the product earns attention rather than stealing it, and users can stay absorbed in their task.

### Trust & privacy psychology — transparency, control, and asking-in-context build trust; surprise destroys it
**Explains:** requesting permissions in context with a clear reason; collecting the minimum necessary; giving the user control; never manipulating (the honesty principle).
**Apply:** ask for access at the moment its purpose is obvious, and say why. Take the least you need. Make the trusting choice the easy one and the decline painless. Trust compounds; one surprising or manipulative moment can spend years of it at once.
**You got it right when:** users grant access willingly because the reason is self-evident and the ask is honest.

### Habituation & consistency over time — repetition builds muscle memory; stability is a feature
**Explains:** not moving controls between releases; preserving gestures and placements; the long-term half of Jakob's Law.
**Apply:** once users have learned where something is, moving it imposes a real relearning tax. Change layout and core interactions only for a clearly worth-it gain, and ease the transition when you do.
**You got it right when:** returning users operate the product without re-learning it.

## Reference

- Jon Yablonski, *Laws of UX* (Fitts, Hick, Jakob, Miller, Doherty, Von Restorff, serial position, goal-gradient, Zeigarnik, peak-end, aesthetic-usability): https://lawsofux.com/
- Don Norman, *The Design of Everyday Things* (affordances, signifiers, conceptual models, slips vs mistakes, emotional design): https://www.nngroup.com/books/design-everyday-things-revised/
- Nielsen Norman Group, usability heuristics (recognition over recall, error prevention, feedback, user control): https://www.nngroup.com/articles/ten-usability-heuristics/
- Apple HIG (the rules these principles explain): https://developer.apple.com/design/human-interface-guidelines
- See also `references/philosophy.md` (values) and `references/applying.md` (method).

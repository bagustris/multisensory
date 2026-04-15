---
marp: true
theme: gaia
paginate: true
math: katex
---

# Human-AI Interaction: 
## Multimodal Information Processing


<br /><br /><br />  
    
Bagus Tris Atmaja
Assistant Professor – Human-AI Interaction
Email: bagus.tris@naist.ac.jp

---

## Overview

This lecture covers the **computational** side of multimodal AI:

1. From human perception to machine processing
2. Three foundational principles & six core challenges
3. Representation, alignment, reasoning, generation, transference, quantification
4. Designing multisensory experiences (Obrist & Velasco, 2025)
5. Fusion methods and architectures in practice
6. Benchmarking, evaluation, and open questions

```markdown
Liang, Zadeh & Morency (2024), Foundations & Trends in MML*, ACM Computing Surveys; Obrist & Velasco (2025), Multisensory Experiences, CACM; MultiBench/MultiZoo (NeurIPS 2021, JMLR 2022).
```
<!-- ```
maller text in Marp:
    
```markdown
<small>**Sources:** Liang, Zadeh & Morency (2024), *Foundations & Trends in MML*, ACM Computing Surveys; Obrist & Velasco (2025), *Multisensory Experiences*, CACM; MultiBench/MultiZoo (NeurIPS 2021, JMLR 2022).</small>
```

Or using CSS:

```markdown
<style scoped>
p { font-size: 0.75em; }
</style>

**Sources:** Liang, Zadeh & Morency (2024), *Foundations & Trends in MML*, ACM Computing Surveys; Obrist & Velasco (2025), *Multisensory Experiences*, CACM; MultiBench/MultiZoo (NeurIPS 2021, JMLR 2022). -->

---

## What is a Modality?

A **modality** is a way in which a natural phenomenon is perceived or expressed.

| Modality | Sensor | Example |
|----------|--------|---------|
| Speech / Audio | Microphone | Spoken words, tone of voice |
| Image / Video | Camera | Facial expressions, gestures |
| Text | Keyboard | Transcripts, captions |
| Touch / Haptics | Force sensor | Grip pressure, surface texture |
| Physiological | EEG, ECG | Heart rate, brain activity |

> Modalities range from **raw** (sensor signal) to **abstract** (high-level semantic features).

---

## Why Multimodal?

Humans naturally integrate multiple senses. Machines benefit too:

- **Affective computing**: sentiment from speech + face + words
- **Healthcare**: diagnosis from imaging + lab tests + clinical notes
- **Robotics**: manipulation with vision + touch
- **HCI**: UI understanding from screenshots + layout structure
- **Multimedia**: movie genre from video + audio + subtitles

> Single modalities are often noisy, ambiguous, or incomplete — combining them produces more **robust** and **accurate** systems.

---

## From Human Perception to Machine Processing

The previous lecture (*Multisensory Communicative AI*) introduced the **human** side:
- Sensation → Perception → Integration
- Temporal, Spatial, and Inverse Effectiveness principles
- Illusions as evidence of integration (McGurk, Ventriloquist, Rubber Hand)

This lecture asks: **how do machines replicate — and extend — this capability?**

> The gap between human multisensory perception and machine multimodal learning is the research frontier.

---

## Bridging Human Principles & Computation

<style scoped>
table {
  font-size: 30px;
}
</style>

| Human Principle | Machine Challenge |
|-----------------|------------------|
| **Temporal principle** — stimuli integrated when co-occurring | Continuous **alignment** (dynamic time warping, segmentation) |
| **Spatial principle** — stimuli integrated when co-located | Discrete **alignment** (grounding, region-word matching) |
| **Inverse effectiveness** — weak unimodal → strong integration | **Robustness** and **transference** to low-resource modalities |
| **McGurk effect** — AV synergy creates new percept | Modality **interactions** (synergy, emergence) |
| **Sensory dominance** — one sense overrides others | Modality **bias** and quantification of task relevance |

---

## Three Foundational Principles

*(Liang et al., 2024)*

Every multimodal problem is shaped by three properties of the data:

| Principle | Question |
|-----------|----------|
| **Heterogeneity** | How different are the modalities from each other? |
| **Connections** | How are elements across modalities related? |
| **Interactions** | How do modalities *jointly* influence the task? |

These principles motivate all six core technical challenges.

---

## Principle 1 — Modality Heterogeneity
Modalities differ across six dimensions:

<style scoped>
table {
  font-size: 24px;
}
</style>
| Dimension | Description | Example |
|-----------|-------------|---------|
| **Element** | Basic unit of the modality | Pixel vs. word vs. Hz sample |
| **Distribution** | Frequency of elements | Words follow Zipf's law |
| **Structure** | How elements compose | Spatial (image) vs. sequential (audio) |
| **Information** | Total content per modality | Dense video vs. sparse label |
| **Noise** | Type of corruption | Occlusion (vision) vs. background noise (audio) |
| **Task relevance** | How useful the modality is | Sarcasm: tone > literal words |

> Heterogeneity makes multimodal processing fundamentally harder than unimodal processing.

---
<style scoped>
{
  font-size: 32px;
}
</style>

## Principle 2 — Modality Connections
How are elements in different modalities related?



- **Statistical association**: co-occurrence (lip movement ↔ speech sound)
- **Statistical dependence**: causal or confounding relationship (emotion → voice pitch AND facial expression)
- **Semantic correspondence**: same concept, different surface form ("dog" ↔ image of dog)
- **Semantic relations**: broader, relational meaning ("red" ↔ visual redness, danger, emotion)

> Connections are the **substrate** on which alignment and reasoning operate.

---

## Principle 3 — Modality Interactions
<style scoped>
table {
  font-size: 24px;
}
</style>

How do modalities jointly affect the prediction?

$$
I(M_1; M_2; Y) = \underbrace{R}_{\text{redundancy}} + \underbrace{U_1 + U_2}_{\text{uniqueness}} + \underbrace{S}_{\text{synergy}}
$$

| Type | Meaning | Example |
|------|---------|---------|
| **Redundancy** | Both modalities carry same info | Face + voice both signal sadness |
| **Uniqueness** | One modality carries info the other lacks | Sarcasm: tone says "no", words say "yes" |
| **Synergy** | New info only emerges *together* | McGurk effect: AV beat audio or video alone |

---

## Interactions: Concrete Example

**Task**: predict sentiment from a video clip

```
"This is great"  (words = positive)
[flat tone]      (audio = neutral)
[frown]          (face = negative)
```

- If words dominate → **false positive**
- Integrating all three → recognises **sarcasm**

This is a case of **unique** information in the non-verbal channels and **synergistic** interaction across all three modalities.

---

## Six Core Technical Challenges
<style scoped>
table {
  font-size: 30px;
}
</style>

*(Liang et al., 2024 — taxonomy)*

| # | Challenge | Core Question |
|---|-----------|--------------|
| 1 | **Representation** | How do we encode and combine multimodal data? |
| 2 | **Alignment** | How do we link elements across modalities? |
| 3 | **Reasoning** | How do we compose multimodal knowledge? |
| 4 | **Generation** | How do we produce coherent multimodal output? |
| 5 | **Transference** | How do we transfer knowledge across modalities? |
| 6 | **Quantification** | How do we measure heterogeneity and interactions? |

---

## Challenge 1 — Representation
<style scoped>
{
  font-size: 32px;
}
</style>
Three sub-challenges:

**Fusion** — integrate two or more modalities into a joint representation
$$z_{mm} = f(x_1, x_2, \ldots, x_M)$$

**Coordination** — keep modalities separate but align them in a shared space
$$\text{sim}(\phi_1(x_1), \phi_2(x_2)) \uparrow \text{ for matched pairs}$$

**Fission** — decompose into disjoint factors (modality-specific + shared)
$$z = [z_{\text{shared}},\ z_{\text{modal-1}},\ z_{\text{modal-2}}]$$

---

## Representation Fusion:  Additive & Multiplicative
<style scoped>
{
  font-size: 32px;
}
</style>
**Additive (late/ensemble fusion):**
$$z_{mm} = w_0 + w_1 x_1 + w_2 x_2$$

**Multiplicative Interactions (MI):**
$$z_{mm} = w_0 + w_1 x_1 + w_2 x_2 + w_3 (x_1 \times x_2)$$

- Additive = first-order polynomial; MI = second-order polynomial.  

- Cross-term $w_3(x_1 \times x_2)$ captures **moderation**: modality 1 affects how modality 2 relates to the label.

---

## Repr. Coordination: Contrastive Learning

Goal: matched pairs → close in embedding space; unmatched pairs → far.

$$\mathcal{L}_{\text{contrastive}} = -\log \frac{e^{\text{sim}(z_1^+, z_2^+)/\tau}}{\sum_j e^{\text{sim}(z_1, z_{2,j})/\tau}}$$

Examples: **CLIP** (image ↔ text), **wav2BerT** (audio ↔ text).

- Contrastive learning provably captures **redundant** information across views, but **not** unique or synergistic information — a known limitation.

---

## Representation Fission — Disentanglement

Goal: separate modality-specific from shared information.

```
Input:  [audio, text, video]
Output: z_shared   ← emotion signal present in all
        z_audio    ← speaker-specific prosody
        z_text     ← linguistic content
        z_video    ← facial muscle movements
```

> Fission enables **interpretability** and **fine-grained control** (e.g., swap only the style of a modality).

---

## Challenge 2 — Alignment

<style scoped>
{
  font-size: 28px;
}
</style>
How do we find which elements across modalities correspond?

| Type | Description | Method |
|------|-------------|--------|
| **Discrete** | Given word tokens and image regions, find matches | Attention, optimal transport |
| **Continuous** | Align continuous signals (speech waveform ↔ motion capture) without segmentation boundaries | Dynamic time warping, clustering |
| **Contextualized** | Learn representations that incorporate cross-modal context | Multimodal Transformer (MULT, CLIP, Flamingo) |

Alignment difficulty: long-range dependencies, ambiguous segmentation, many-to-many mappings.

---

## Challenge 3 — Reasoning
<style scoped>
{
  font-size: 32px;
}
</style>

Composing multimodal knowledge through multiple inference steps.

- **Structure modeling**: define the composition graph (hierarchical, temporal, interactive, discovered)
- **Intermediate concepts**: attention maps, discrete symbols, natural language as reasoning medium
- **Inference paradigm**: neural (soft), logical (rule-based), causal (counterfactual)
- **External knowledge**: knowledge graphs, commonsense databases

Example: Visual Question Answering requires grounding the question in the image and reasoning over object relations.

---

## Challenge 4 — Generation

Producing multimodal output that is coherent and consistent.

| Sub-task | Input → Output | Example |
|----------|----------------|---------|
| **Summarization** | Video → text | News video summary |
| **Translation** | Text → image | DALL-E, Stable Diffusion |
| **Creation** | Text prompt → video + audio | Synchronized multimedia generation |

> Key challenge: **evaluation** — how do we measure cross-modal coherence? Ethical risks: deepfakes, bias amplification.

---

## Challenge 5 — Transference
<style scoped>
{
  font-size: 32px;
}
</style>
Transfer knowledge from a *resource-rich* modality to a *resource-poor* one.

- **Cross-modal transfer**: pretrain on large image-text corpus → fine-tune for touch/radar
- **Multimodal co-learning**: share representations; use pseudo-labels from one modality to supervise another
- **Model induction**: distil behaviour from a pretrained unimodal model into a new model for a different modality

Motivation: text and images have huge pretraining corpora; audio, haptics, physiological signals do not.

---

## Challenge 6 — Quantification
<style scoped>
{
  font-size: 32px;
}
</style>
Empirically and theoretically understanding multimodal learning.
- **Heterogeneity metrics**: measure how different modalities are (information content, noise topology)
- **Bias quantification**: detect and mitigate modality-specific social biases
- **Interaction quantification**: redundancy, uniqueness, synergy (Partial Information Decomposition)
- **Learning process**: why does joint multimodal training sometimes underperform unimodal? (lazy modality, gradient conflicts)
- **Robustness metrics**: *relative robustness* and *effective robustness* under noise

---

## Designing Multisensory Experiences

<style scoped>
{
  font-size: 32px;
}
</style>
*(Obrist & Velasco, 2025 — Communications of the ACM)*

Moving from the **ML taxonomy** to the **design perspective**:

"We call this fusion of carefully crafted sensory elements within specific events to form a desired impression a **multisensory experience**."

- Bridges **science** (multisensory perception research) and **technology** (HCI, XR, AI)
- Relevant for: affective computing, embodied AI, human-centered multimodal systems
- Raises **design and ethical** questions that complement the computational challenges

---

## What Makes a Multisensory Experience?

<style scoped>
{
  font-size: 28px;
}
</style>

**Definition (Obrist & Velasco, 2025):**  
A structured fusion of sensory elements across events, shaped for a specific receiver to produce a desired impression.

**Four conceptual components:**

| Component | Description |
|-----------|-------------|
| **Impression** | The desired overall effect or meaning to be conveyed |
| **Event** | A specific episode or moment within the experience journey |
| **Sensory elements** | The individual stimuli (visual, auditory, tactile, olfactory, gustatory) |
| **Receiver** | The person experiencing — shaped by context, background, and state |

---

## The Experience Journey

<style scoped>
{
  font-size: 32px;
}
</style>

A multisensory experience is not a single event — it is a **journey**:

```
Pre-encounter  →  Primary event   →  Post-encounter
(expectation)      (sensation  +       (memory +
                    perception +        reflection)
                    cognition  +
                    emotion)
```

- **Bottom-up** processing: sensory properties attract attention
- **Top-down** processing: goals and expectations shape perception
- Individual events can be further decomposed via **micro-phenomenology**

A coffee brand experience starts before you open the package and continues long after the last sip.

---

## Sensory Congruence and Key Concepts
<style scoped>
{
  font-size: 28px;
}
</style>
When designing multisensory experiences, four perceptual concepts guide decisions:

| Concept | Meaning | Example |
|---------|---------|---------|
| **Sensory congruence** | Stimuli feel consistent across modalities | Dubbed film feels "off" — audio ≠ lip movement |
| **Crossmodal correspondences** | Systematic associations between features across senses | Round shapes ↔ sweet taste; angular shapes ↔ bitter/sour |
| **Sensory dominance** | One sense overrides others at specific moments | Vision dominates spatial judgements (ventriloquist effect) |
| **Sensory overload** | Too much stimulation overwhelms processing | Loud music + strong smell + flashing lights |

> These principles directly inform the **alignment** and **interaction** challenges in ML.

---

## The Multisensory Ecosystem
<style scoped>
{
  font-size: 30px;
}
</style>
Sensory elements do not simply **add up** — they form an **interconnected network**:

$$\text{Impression} \neq \sum_i \text{SensoryElement}_i$$

- The taste of food is altered by its **colour** (crossmodal correspondence)
- A sour taste synchronized with a new character on screen creates **surprise** (temporal + semantic congruence)
- Touch and smell in a VR film create **presence** that audio-visual alone cannot

Analogous to **synergy** in ML interaction theory: new information only emerges from the combination.

---

## The Receiver — Individual Differences
<style scoped>
{
  font-size: 32px;
}
</style>
A multisensory experience is **always relative to its receiver**:

- **Sociocultural background**: colour meanings differ across cultures
- **Previous experience**: prior encounters shape expectations and appraisal
- **Personality and sensitivity**: sensory processing sensitivity, supertasters
- **Neurodiversity and disability**: sensory impairments change modality access

Machine learning systems must similarly account for **user heterogeneity** — personalization, fairness, and accessibility are not optional extras.

---

## Where the Senses Meet Technology
<style scoped>
{
  font-size: 30px;
}
</style>
Technology enables multisensory experiences along a **reality–virtuality continuum**:

| Mode | Description | Example |
|------|-------------|---------|
| **Physical** | Real sensory stimuli in real environments | Live concert, food tasting |
| **Augmented Reality** | Digital overlays on physical world | AR flowers with information |
| **Mixed Reality** | Physical objects + digital environment | Eating real food in VR colour room |
| **Virtual Reality** | Fully digital, with haptic/olfactory devices | Dark matter dome experience |


---

## Example 1 — Multisensory Eating in VR
<style scoped>
{
  font-size: 28px;
}
</style>

*(Obrist & Velasco, 2025)*

**Impression**: alter taste perception without changing the food itself  
**Event**: participants eat real food while wearing a VR headset  
**Sensory elements**: real food (taste + smell) + VR ambient colour + VR food shape  
**Receiver**: adults, no sensory impairments, UK residents

**Crossmodal correspondences used:**
- Red / pink → perceived as sweeter
- Round shapes → sweet; angular shapes → bitter/sour

**Computational parallel**: exploiting learned **crossmodal associations** (semantic correspondence) to influence perception — analogous to cross-modal transfer in ML.

---

## Example 2 — Dark Matter Experience

*(Obrist & Velasco, 2025)*

**Impression**: make an *invisible, abstract* concept perceivable and emotionally engaging  
**Event**: science museum dome installation, Great Exhibition Road Festival 2019  
**Sensory elements**: scent + spatial audio + cosmic visuals + haptic vibrations — synchronized by a central computer  
**Receiver**: museum visitors of varied scientific backgrounds

**Key insight**: sensory substitution can make the **imperceptible** perceivable.


---

## Responsibilities — Three Laws

<style scoped>
{
  font-size: 30px;
}
</style>
Obrist & Velasco (2025) propose **three laws for multisensory experiences**, inspired by Asimov's robotics laws:

1. **Non-harm**: A multisensory experience must not harm the receiver, physically or psychologically.
2. **Fairness**: It must treat all receivers equitably, regardless of background, ability, or identity.
3. **Transparency**: It must be transparent about its creators, its sensory elements, and its intentions.

These map directly to AI ethics: **safety, fairness, and explainability** — now extended to the sensory domain. The **AREA framework** (Anticipate, Reflect, Engage, Act) is proposed for responsible innovation in multisensory design.

---

## Inclusive Multisensory Design
<style scoped>
{
  font-size: 28px;
}
</style>
**Sensory-substitution devices** enable people with sensory impairments to access multisensory experiences:
- "Seeing through sound" — visual information encoded as auditory signals
- Tactile storytelling ("Touch the Story") — narrative engagement through haptic feedback

**Inclusive design** considerations:
- Design *for diversity* from the start, not as an afterthought
- Richer experiences for *all* when designed with diverse receivers in mind
- Addresses digital divide and equitable access to multisensory technologies

**Connection to ML**: fairness and robustness across user subgroups require the same inclusive mindset — consider representation in training data, not just architecture.

---

## MultiBench: A Unified Benchmark 

**MultiBench** (Liang et al., NeurIPS 2021) standardises multimodal research. Three evaluation axes:

| Scope | # |
|-------|---------|
| Datasets | 15 |
| Modalities | 10 |
| Prediction tasks | 20 |
| Research areas | 6 |

<style scoped>
    section {
        display: block;
    }
    table {
        width: max-content;
        float: right;
    }
</style>

1. **Performance** — accuracy, F1, AUPRC
2. **Complexity** — parameters, training time, peak memory
3. **Robustness** — performance under missing or noisy modalities

---

## MultiBench Datasets

<style scoped>
{
  font-size: 29px;
}
</style>

| Domain | Dataset | Modalities | Task |
|--------|---------|------------|------|
| Affective | CMU-MOSI/MOSEI | Text + Audio + Video | Sentiment |
| Affective | MUStARD | Text + Audio + Video | Sarcasm |
| Healthcare | MIMIC | Static + Time-series | Mortality / ICD9 |
| Robotics | Vision & Touch | Image + Force | Contact detection |
| Robotics | MuJoCo Push | Image + Proprioception | Object pose |
| Finance | Stocks | Multiple stock series | Price prediction |
| HCI | ENRICO | Screenshot + Layout | UI category |
| Multimedia | AV-MNIST | Image + Audio | Digit recognition |
| Multimedia | MM-IMDb | Image + Text | Genre classification |

---

## MMDL: The Unified Architecture

MultiBench provides one composable architecture:

```python
class MMDL(nn.Module):
    def __init__(self, encoders, fusion, head):
        self.encoders = nn.ModuleList(encoders)  # one per modality
        self.fuse = fusion                        # fusion module
        self.head = head                          # task head

    def forward(self, inputs):
        reps = [enc(x) for enc, x in zip(self.encoders, inputs)]
        fused = self.fuse(reps)
        return self.head(fused)
```

Mix and match: swap any encoder, any fusion module, any task head.

---

## Fusion Methods: Early & Late

**Early Fusion**: concatenate raw or feature *before* learning:
$$z = W \cdot [x_1 \,\|\, x_2 \,\|\, \cdots \,\|\, x_M] + b$$
    
Simple, captures low-level interactions, one modality can dominate.

**Late Fusion**: train unimodal predictors, aggregate predictions:
$$\hat{y} = \sum_m w_m f_m(x_m)$$

Each modality trains at its own pace, no interactions

---

## Tensor Fusion

**Tensor Fusion** (Zadeh et al., 2017) captures all higher-order interactions via outer product:

$$Z_{TF} = (x_1 \oplus 1) \otimes (x_2 \oplus 1) \otimes (x_3 \oplus 1)$$

Appending $1$ ensures lower-order terms are included.

For 3 modalities of size $d_1, d_2, d_3$:
$$Z_{TF} \in \mathbb{R}^{(d_1+1)(d_2+1)(d_3+1)}$$

Expressive but **expensive** — dimensionality grows multiplicatively.

---

## Low-Rank Tensor Fusion

**Low-Rank Tensor Fusion** (2018) factorises the tensor weight:

$$W = \sum_{r=1}^{R} w_1^{(r)} \otimes w_2^{(r)} \otimes w_3^{(r)}$$

Rank $R \ll d_1 d_2 d_3$ → drastically fewer parameters.

```python
class LowRankTensorFusion(nn.Module):
    # Projects each modality into rank-R factors
    # then combines via element-wise product and sum
```
Same expressivity target as full tensor fusion, but **tractable** at scale.

---

## Multimodal Transformer (MulT)

**MULT** uses directional cross-modal attention:

For source modality $\beta$ and target modality $\alpha$:
$$\text{CM-Attn}_{\beta \to \alpha}: Q = x_\alpha,\ K = V = x_\beta$$

$$z_{\alpha \leftarrow \beta} = \text{Softmax}\!\left(\frac{Q K^\top}{\sqrt{d}}\right) V$$

Each token in $\alpha$ attends to all tokens in $\beta$ at every time step — captures **long-range cross-modal dependencies** without explicit alignment.

---

## MultiBench Evaluation

- **Complexity**: Peak memory, number of parameters, training and inference time.

- **Robustness**
    $$\text{Relative Robustness} = \frac{\text{perf under noise}}{\text{perf without noise}}$$

    $$\text{Effective Robustness} = \text{perf under noise} - \text{baseline (unimodal)}$$

Plotting both reveals the **accuracy–robustness tradeoff**: some fusion methods are accurate but brittle; others are robust but weaker.

---

## Open Questions (Liang et al., 2024>9.1)
<style scoped>
{
  font-size: 32px;
}
</style>
- **Representation**: How do we formally quantify heterogeneity and interactions? What theoretical guarantees can we give for fusion methods?
- **Alignment**: Compositionality — can models align *novel* combinations of elements?
- **Generation**: Synchronized audio-video-text creation remains unsolved; ethical risks (deepfakes, bias) need frameworks.
- **Transference**: High-modality learning (>5 modalities) — how to handle non-parallel data?
- **Quantification**: Explainability for non-visual modalities (audio, haptics, physiological) — how to interpret learned representations?

---

## Summary
<style scoped>
{
  font-size: 30px;
}
</style>
**From Perception to Processing:** Human principles (temporal, spatial, inverse effectiveness) ↔ alignment, robustness, transference in ML

**Three Foundational Principles** (Liang et al., 2024):  Heterogeneity · Connections · Interactions

**Six Core Challenges:** Representation → Alignment → Reasoning → Generation → Transference → Quantification

**Designing Multisensory Experiences** (Obrist & Velasco, 2025):
- Four components: Impression · Event · Sensory elements · Receiver
- Senses meet technology on the reality–virtuality continuum
- Responsibilities: non-harm, fairness, transparency (Three Laws)

--- 
**Practice (MultiBench / MultiZoo):**
- MMDL: Encoders → Fusion → Head
- Fusion spectrum: 
    - Early & Late Fusion 
    - Low-Rank Tensor Fusion
    - MI 
    - Cross-modal Attention
- Evaluation: Performance, Complexity, Robustness

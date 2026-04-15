---
marp: true
theme: gaia
paginate: true
math: katex
# style: |
#   section {
#     font-size: 22px;
#     padding: 40px 50px;
#   }
#   section h2 {
#     font-size: 30px;
#     margin-bottom: 10px;
#   }
#   section h3 {
#     font-size: 24px;
#   }
#   section p, section li {
#     font-size: 20px;
#     line-height: 1.4;
#   }
#   section table {
#     font-size: 18px;
#   }
#   section img {
#     display: block;
#     margin: 0 auto;
#   }
#   section.title h1 {
#     font-size: 40px;
#   }
---

<!-- _class: title -->

# Human-AI Interaction: 
## Human Multisensory Perception

<br /><br /><br />
Bagus Tris Atmaja 
Assistant Professor – Human-AI Interaction

---

## Motivation

- Humans use multiple modalities to communicate (e.g., speech, facial expressions, gestures).
- We sense the world through multiple channels — not just five.
- This sub-course consists of two parts:
  - **Multisensory perecption**: how humans sense and interpret the world through our senses combine these channels.
  - **Multimodal processing**: how to design AI systems that can process and integrate information from multiple modalities.

---

## Overview: Sensation, Perception & the Senses

| Topic |
|-------|
| Sensation vs. Perception |
| Waves and Wavelengths |
| Vision |
| Hearing |
| The Other Senses |
| Gestalt Principles of Perception |

---

# Sensation vs. Perception

**Sensation** — occurs when sensory receptors detect stimuli and convert them into neural signals sent to the brain.

**Transduction** — conversion from sensory stimulus energy to action potential.

**Stimuli** (sing. *stimulus*) — any detectable change in the internal or external environment.

**Perception** — the way sensory information is organized, interpreted, and consciously experienced.

> Not all sensations result in perception.

---

## Our Sensory Modalities
<style scoped>
{
  font-size: 26px;
}
</style>

More than five senses exist:

| Sense | Modality |
|-------|----------|
| Vision | Light |
| Hearing (audition) | Sound waves |
| Smell (olfaction) | Chemical |
| Taste (gustation) | Chemical |
| Touch (somatosensation) | Mechanical |
| Balance | Vestibular |
| Body position/movement | Proprioception & Kinesthesia |
| Pain | Nociception |
| Temperature | Thermoception |

---

## Absolute Threshold

**Absolute threshold** — minimum stimulus energy detectable 50% of the time.

Examples:
- Candle flame visible from **30 miles** away on a clear night
- Clock tick audible from **20 feet** away in quiet conditions

**Subliminal messages** — stimuli below threshold for conscious awareness. Research shows little effect on real-world behavior.

---

## Difference Threshold & Weber's Law

**Just noticeable difference (JND)** — the smallest detectable difference between two stimuli.

**Weber's Law**: The difference threshold is a *constant fraction* of the original stimulus.

Example: A phone screen lighting up is obvious in a dark movie theater, but unnoticed in a brightly lit arena — same brightness, different context.

---

## Bottom-Up vs. Top-Down Processing

![w:880](assets/figure_5.2_topdown_bottomup.jpg)

Top-down processing uses prior knowledge; bottom-up processing is driven by sensory input.

---

## Bottom-Up & Top-Down

**Bottom-up**: automatic, stimulus-driven, involuntary
- e.g., crashing sound in a restaurant captures attention regardless of what you were focusing on

**Top-down**: goal-directed, deliberate, voluntary
- e.g., scanning for a yellow key fob in likely locations, ignoring the ceiling fan

Sensation is **physical**; Perception is **psychological**.

---

## Sensory Adaptation

**Sensory adaptation** — the decrease in sensitivity to a stimulus that remains constant over time.

Example: A flashing construction light outside your hotel window seems very annoying at first, but after watching TV for a while, you no longer notice it — even though your photoreceptors still detect it.

---

## Attention & Inattentional Blindness

**Inattentional blindness** — failure to notice a fully visible stimulus because attention is elsewhere.

Simons & Chabris (1999): While counting basketball passes, nearly **half** of participants failed to notice a gorilla walking through the scene — visible for 9 seconds.

**Signal detection theory** — ability to identify a stimulus embedded in background noise; affected by motivation and expectation.

---

## Inattentional Blindness

![w:620](assets/figure_5.3_inattentional_blindness.jpg)

About ⅓ of participants missed a red cross on screen because attention was focused on black/white figures. (credit: Cory Zanker)

---

## Cultural & Individual Effects on Perception

- Beliefs, values, personality, and culture all shape perception.
- Segall et al. (1963): Western cultures (carpentered world) more susceptible to the **Müller-Lyer illusion**; Zulu people (round structures) less susceptible.
- Cross-cultural differences also found in odor identification and taste preferences.

---

## Müller-Lyer Illusion

![w:700](assets/figure_5.4_muller_lyer.jpg)

Lines appear to be different lengths although they are identical — a classic example of how top-down expectations shape perception.

---

# Waves and Wavelengths

The key physical characteristics of a wave:

- **Amplitude** — distance from center line to crest (peak) or trough; associated with **intensity**
- **Wavelength** — length from one peak to the next; inversely related to frequency
- **Frequency** — number of wave cycles per second, measured in **hertz (Hz)**

Higher frequency = shorter wavelength; lower frequency = longer wavelength.

---

## Wave Amplitude and Wavelength

![w:700](assets/figure_5.5_wave.jpg)

**Figure 5.5** Amplitude is measured from peak to trough; wavelength is measured peak to peak.

---

## Frequency and Wavelength

![w:700](assets/figure_5.6_frequencies.jpg)

**Figure 5.6** Waves of differing wavelengths and frequencies. From top to bottom: wavelengths decrease, frequencies increase.

---

## Light Waves: The Electromagnetic Spectrum

![w:800](assets/figure_5.7_spectrum.jpg)

Visible light is only a small portion of the full electromagnetic spectrum (380–740 nm). Other species detect beyond human range: honeybees (UV), some snakes (infrared).

---

## Color and Wavelength

![w:920](assets/figure_5.8_vis_spectrum.jpg)

Different wavelengths correspond to different colors. Mnemonic: **ROYGBIV**.
- Reds → longer wavelengths
- Violets/Blues → shorter wavelengths
- Amplitude → brightness/intensity

---

## Sound Waves

- **Pitch** ↔ frequency: high frequency = high pitch; low frequency = low pitch
- Human audible range: **20–20,000 Hz**
- **Loudness** ↔ amplitude, measured in **decibels (dB)**
  - Conversation ≈ 60 dB; Rock concert ≈ 120 dB
  - Hearing damage risk from ~80 dB; pain threshold ~130 dB
- **Timbre** — a sound's purity; explains why instruments sound different at same pitch and loudness

---

## Loudness of Common Sounds

![bg left](assets/figure_5.9_aud_range.jpg)



Loudness levels of common sounds: ~⅓ of all hearing loss is due to noise exposure.

---


## Vision: The Eye

![bg right w:600](assets/figure_5.11_eye_anatomy.jpg)

Our eyes gather sensory information for interpreting the world.


**Key structures:**  
cornea → pupil → lens → retina → fovea → optic nerve

---

## Photoreceptors: Rods and Cones

Cones (green) are concentrated in the fovea; rods (blue) cover the rest of the retina.


<style scoped>
    section {
        display: block;
    }
    table {
        width: max-content;
        float: right;
        font-size: 24px;
    }
</style>



| | Rods | Cones |
|--|------|-------|
| Location | Periphery | Fovea |
| Light condition | Dim | Bright |
| Function | Motion, low-light | Color, detail |


![w:550](assets/figure_5.12_rods_cones.jpg)

---

![bg left w:650](assets/figure_5.13_optic_chiasm.jpg)

At the optic chiasm, right-visual-field info goes to left hemisphere and vice versa. Processed in occipital lobe.

- **"What" pathway** — object recognition
- **"Where/How" pathway** — location and spatial interaction

---

## Color Vision

**Trichromatic theory**: three cone types sensitive to red, green, and blue; all colors produced by combining these.

**Opponent-process theory**: color coded in opponent pairs (red-green, blue-yellow, black-white). Explains **negative afterimages**.

Both theories apply — trichromatic at the retina level; opponent-process further up toward the brain.

---

## Trichromatic Theory

![bg right w:700](assets/figure_5.14_trichromatic.jpg)

Sensitivity curves for the three cone types. Red-green color blindness affects ~8% of European males.

---

## Negative Afterimage

![w:500](assets/figure_5.16_afterimage.jpg)

Stare at the white dot for 30–60 seconds, then look at a white surface. The afterimage demonstrates opponent-process theory.

---

## Depth Perception

**Binocular cues** (both eyes):
- **Binocular disparity** — slightly different view from each eye; basis of 3-D movies

**Monocular cues** (one eye):
- **Linear perspective** — parallel lines converge in the distance
- **Interposition** — partial overlap of objects
- Relative size, closeness to horizon

---

## Linear Perspective (Monocular Depth Cue)

![w:650](assets/figure_5.17_linear_perspec.jpg)

We perceive depth in a 2-D image through monocular cues like converging parallel lines. *(credit: Marc Dalmulder)*

---

# Hearing
![w:760](assets/figure_5.18_ear_anatomy.jpg)

The ear: outer (pinna, tympanic membrane), middle (ossicles: malleus, incus, stapes), inner (cochlea, basilar membrane).

---

## How We Hear

Sound waves → tympanic membrane → ossicles → oval window → cochlear fluid → **hair cells** → auditory nerve → brain (auditory cortex in temporal lobe)

**Hair cells** are the auditory receptor cells. Their mechanical activation generates neural impulses.

---

## Pitch Perception

Two theories:

**Temporal theory** — frequency coded by firing rate of hair cells. Limited to ~4,000 Hz.

**Place theory** — different parts of basilar membrane respond to different frequencies. Base = high frequency; tip = low frequency.

Both apply: up to ~4,000 Hz, both rate and place contribute. Higher frequencies rely on place alone.

---

## Sound Localization

<!-- ![bg left w:500](assets/figure_5.19_sound_local.jpg) -->
<img src="assets/figure_5.19_sound_local.jpg" alt="Marp" width="500" align="right " />

Sound localization uses both monaural and binaural cues.

- **Monaural cues**: pinna shape → above/below and front/behind
- **Interaural level difference**: louder in nearer ear
- **Interaural timing difference**: tiny delay between ears → left/right location

---

## Hearing Loss

**Conductive hearing loss** — failure in vibration of eardrum/ossicles; treatable with hearing aids.

**Sensorineural hearing loss** — failure in neural transmission from cochlea to brain; most common form.

Causes: aging, noise exposure, trauma, infections, medications.

**Cochlear implants** — bypass hair cells and directly stimulate the auditory nerve.

---

# The Other Senses
## Chemical Senses: Taste (Gustation)

At least **6 taste qualities**: sweet, salty, sour, bitter, **umami**, and fatty.

- Taste buds on the tongue detect molecules dissolved in saliva.
- Taste information → medulla → thalamus → limbic system → **gustatory cortex** (frontal-temporal junction)
- Taste buds regenerate every 10–14 days.

---

## Taste Bud Anatomy

![w:740](assets/figure_5.21_taste_bud.jpg)

(a) Taste receptor cells in a taste bud. 
(b) Microscopic view of tongue surface.

---

## Chemical Senses: Smell (Olfaction)

- Olfactory receptors in the nasal mucous membrane detect airborne molecules.
- Signals go to the **olfactory bulb** → limbic system and **primary olfactory cortex**.
- Dogs have 800–1,200 functional olfactory receptor genes vs. ~400 in humans.
- **Pheromones** — chemical signals between individuals (prominent in many species).
- Taste and smell work **together** to produce flavor perception.

---
<br/> 

### Olfactory Receptors

![bg left w:730](assets/figure_5.22_olfac_recep.jpg)

<br/>
Hair-like olfactory receptor extensions protrude into the nasal mucous membrane to bind odor molecules.

---

## Touch: Somatosensation
<style scoped>
{
  font-size: 34px;
}
</style>

Four main types of skin receptors:

| Receptor | Responds to |
|----------|-------------|
| Meissner's corpuscles | Pressure, low-frequency vibration |
| Pacinian corpuscles | Transient pressure, high-frequency vibration |
| Merkel's disks | Light pressure |
| Ruffini corpuscles | Stretch |

Free nerve endings also detect **temperature (thermoception)** and **pain (nociception)**.

---

## Skin Receptors

<!-- ![w:600 right](assets/figure_5.23_touch.jpg) -->

<img src="assets/figure_5.23_touch.jpg" alt="Marp" width="800"  align="right" />

Multiple receptor types in the skin respond to different touch stimuli. Signals travel via spinal cord to **somatosensory cortex** (postcentral gyrus).

---

## Pain (Nociception)

Pain is adaptive — signals injury and motivates avoidance.

- **Inflammatory pain** — signals tissue damage
- **Neuropathic pain** — amplified signals from damaged neurons

**Congenital insensitivity to pain (congenital analgesia)** — extremely rare; individuals sustain severe unnoticed injuries and have shorter life expectancies.

---

## Vestibular, Proprioceptive & Kinesthetic

<!-- ![w:500](assets/figure_5.24_vestibular.jpg) -->
<img src="assets/figure_5.24_vestibular.jpg" alt="Marp" width="500" align="right" />
Vestibular organs (utricle, saccule, semicircular canals) next to the cochlea in the inner ear.

- **Vestibular sense** — balance and head/body orientation
- **Proprioception** — perception of body position
- **Kinesthesia** — perception of body movement through space

---

# Gestalt Principles of Perception

## Gestalt Psychology

Founded by **Max Wertheimer** (early 20th c.), with Köhler and Koffka.

"The whole is different from the sum of its parts."

The brain organizes sensory input into meaningful perceptions in **predictable ways** — these are the Gestalt principles.

Key idea: perception is an active construction, not a passive recording.

---

## Figure-Ground Relationship

![bg left w:600](assets/figure_5.25_faces_vase.jpg)
<!-- <img src="assets/figure_5.25_faces_vase.jpg" alt="Marp" width="500" align="left" /> -->

<br/>
 The Rubin vase: perception alternates between a vase (white figure) and two faces (black figure), depending on what is perceived as figure vs. ground.

---

## Proximity

![w:800](assets/figure_5.26_proximity.jpg)

**Proximity**: things close to each other tend to be grouped together. Left: one block; right: three columns.

---

## Similarity

![bg left w:600](assets/figure_5.27_similarity.jpg)

**Similarity**: like elements are grouped together. We perceive alternating colored rows rather than a grid.

---

## Good Continuation & Closure

**Good continuation**: we perceive two overlapping lines, not four separate line segments.
**Closure**: we perceive complete shapes (circle, rectangle) even when parts are missing.
![h:300](assets/figure_5.28_continuity.jpg)  ![h:300](assets/figure_5.29_closure.jpg) 
<!-- <img src="assets/figure_5.29_closure.jpg" alt="Marp" width="400" align="right" /> -->


---

## Perceptual Set & Bias

**Perceptual hypotheses** — educated guesses when interpreting sensory information, shaped by:
- Personality and prior experience
- Expectations and verbal priming
- Cultural background and implicit biases

Research shows implicit racial bias can affect perception of objects (e.g., misidentifying non-weapons as weapons when paired with racialized images).

---

## Principles of Multisensory Integration

- **Temporal principle**: stimuli from different modalities are more likely integrated if they occur at the same time.
- **Spatial principle**: stimuli are more likely integrated if they occur at the same location.
- **Inverse effectiveness principle**: integration is stronger when individual unisensory signals are weak.

---

## Multisensory Illusions

- **McGurk effect**: mismatched audio and visual speech cues produce a third, different percept.
- **Ventriloquist effect**: sound source perceived at the visual location (puppet's mouth) rather than the actual acoustic source.
- **Rubber hand illusion**: synchronous touch of a fake and real hand induces sense of ownership of the fake hand.

---

## Summary
- Sensation ≠ Perception; attention, adaptation, signal detection  
- Waves: amplitude → intensity; frequency → pitch/color |
- Vision: rods/cones, color theories, depth cues |
- Hearing: hair cells, pitch theories, sound localization |
- Other senses: taste, smell, touch, pain, balance |
- Gestalt: figure-ground, proximity, similarity, closure |

---

## Sources

OpenStax Psychology 2e, Chapter 5 (Spielman, Jenkins & Lovett, 2020).
Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
Access free at openstax.org

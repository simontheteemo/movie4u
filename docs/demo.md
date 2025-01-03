---
layout: default
title: Demo
description: Movie2U Input/Output Examples
---

[Home](./README.md) | 
[Architecture](./architecture.md) | 
[Technical Stack](./technical-stack.md) | 
[Deployment](./deployment.md) | 
[Demo](./demo.md)

# Demo

## Input Example
### Original Video
<iframe width="560" height="315" src="https://www.youtube.com/embed/o-WKik4qp3U" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Output Examples

### 1. Scene Labels
You can view the complete JSON data:
- [View Scene Labels JSON](./data/scene-labels.json)

<details>
<summary>Preview JSON data</summary>
{% include_relative data/scene-labels.json %}
</details>

### 2. Scene Narrative
> Paste your narrative here

### 3. Audio Description
<audio controls>
  <source src="./data/finalPolly.mp3" type="audio/mpeg">
  Your browser does not support the audio element.
</audio>

You can also [download the audio description](./data/finalPolly.mp3) directly.

## Before/After Comparison
| Aspect | Before | After |
|--------|---------|-------|
| Visual Context | No description | Detailed scene labels and narrative |
| Audio Description | None | Natural voice narration |
| Accessibility | Limited | Enhanced for visually impaired users |
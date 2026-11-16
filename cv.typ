// CV — build with `make` (see Makefile).

#let link-color = rgb(0, 51, 153)

#set document(title: "CV – David Sebastian Hoffmann", author: "David Sebastian Hoffmann", date: none)
#set page(paper: "a4", margin: (left: 20mm, right: 15mm, top: 15mm, bottom: 10mm))
#set text(font: "CMU Bright", size: 10pt, lang: "en")
#set par(justify: true, leading: 0.55em, spacing: 1.2em)
#set list(marker: text(size: 9pt)[•], indent: 1pt, body-indent: 5pt, spacing: 0.85em)
#set grid(column-gutter: 12pt, row-gutter: 0.55em)
#show link: set text(fill: link-color)

// Section heading: large regular text with a rule underneath.
#show heading.where(level: 1): it => block(
  above: 28pt, below: 11pt, width: 100%,
  inset: (bottom: 5.6pt), stroke: (bottom: 0.4pt),
  text(size: 14.35pt, weight: "regular", it.body),
)

// Font Awesome 5 icons by codepoint.
#let icon(code, brand: false) = text(
  font: if brand { "Font Awesome 5 Brands" } else { "Font Awesome 5 Free Solid" },
  str.from-unicode(code),
)

// Job/role entry: bold title with date on the right, followed by bullet points.
#let entry(title, date, body) = block(below: 22.7pt)[
  #block(below: 9.3pt, grid(columns: (1fr, auto), strong(title), date))
  #body
]

// Unbulleted line aligned with the bullet text.
#let note(body) = block(above: 8.5pt, pad(left: 10.5pt, body))

// --- Header ------------------------------------------------------------------

#align(center, stack(
  spacing: 19.8pt,
  text(size: 24.8pt)[David Sebastian Hoffmann],
  [
    #link("https://linkedin.com/in/david-hoffmann-b7b51b228")[#icon(0xf08c, brand: true) David Hoffmann]
    #h(0.5em)|#h(0.5em)
    #link("mailto:d.hoffmann@protonmail.com")[#icon(0xf0e0) d.hoffmann\@protonmail.com]
    #h(0.5em)|#h(0.5em)
    #link("tel:+4917634503004")[#icon(0xf10b) +4917634503004]
  ],
))

// --- Content -----------------------------------------------------------------

= Summary

Full-Stack Software Engineer with more than 3 years of experience shipping distributed solutions for large-scale, highly reliable applications. I excel in a high-stakes, high-reward environment, and am adept at delivering impactful solutions with a focus on reliability and quality. My experience in international and collaborative development on large-scale software projects allows me to tackle big challenges with a perspective of long-term planning and ensuring timely delivery. My work prioritizes systemic quality and operational resilience, ensuring solutions not only meet user needs effectively but remain sustainable at scale. Currently applying this focus to build financial systems and warehouse operations for one of Europe's largest grocery chains.

= Work Experience

#entry[Lead Full-Stack Software Engineer at freiheit.com technologies][June 2023 - present][
  - Lead a team of software engineers building products for a distributed warehouse management platform in production across all markets of one of Europe's largest grocery chains.
  - Architected and shipped custom full-stack solutions in Go and TypeScript powering mission-critical systems for invoice processing, credit notes, and difference reconciliation. My solutions process millions of financial documents annually at enterprise scale.
  - Delivered multi-year, high-complexity projects on schedule while meeting stringent quality and reliability standards.
  #note[Technologies: Go, TypeScript, Vue.js, Azure]
]

#entry[Student Software Developer at NAVASTO GmbH][Oct 2021 - April 2023][
  - Coordinated the training, validation and integration of PyTorch models into a framework of cutting edge deep learning solutions for engineering design.
  #note[Technologies: Python, PyTorch, NumPy, Git, CUDA]
]

= Education

#grid(
  columns: (auto, 1fr),
  row-gutter: 18pt,
  [2020 - 2023], [
    M.Sc. in Computer Science at *TU Berlin*
    - Master Thesis on "Multi-Modal Vision Transformers for Multi-Label Remote Sensing Image Classification" (Grade: 1.0)
  ],
  [2016 - 2020], [B.Sc. in Computer Science at *TU Berlin*],
)

= Publications

#par(hanging-indent: 10.5pt)[
  Hoffmann, David Sebastian et al. (2023). "Transformer-Based Multi-Modal Learning for Multi-Label Remote Sensing Image Classification". In: _IGARSS 2023 - 2023 IEEE International Geoscience and Remote Sensing Symposium_, pp.~4891–4894. doi: #link("https://doi.org/10.1109/IGARSS52108.2023.10281927")[#text(font: "CMU Typewriter Text", weight: "light")[10.1109/IGARSS52108.2023.10281927]].
]

= Skills

#grid(
  columns: (auto, 1fr),
  [Programming Languages:], [Go, Typescript, Python, C],
  [Tools:], [GRPC, Azure, Vue.js, PyTorch, Linux, Git],
  [Skills:], [Micro-service architectures, CI/CD, Machine Learning, Remote Sensing],
  [Soft Skills:], [Independent Problem Solving, Collaborative Development, Enthusiastic Learner, Critical Analysis, Reliable Maintainer],
  [Languages:], [English(fluent), German(native), Portuguese(basic level)],
)

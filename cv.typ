// CV — build with `make` (see Makefile).

#set document(title: "CV – David Sebastian Hoffmann", author: "David Sebastian Hoffmann", date: none)
#set page(paper: "a4", margin: (left: 20mm, right: 15mm, top: 15mm, bottom: 10mm))
#set text(font: "CMU Bright", size: 10pt, lang: "en")
#set par(justify: true, leading: 0.55em, spacing: 1.2em)
#set grid(column-gutter: 1.2em, row-gutter: 0.55em)
#show link: set text(fill: rgb(0, 51, 153))

#let bullet = text(size: 0.9em)[•]
#set list(marker: bullet, body-indent: 0.5em, spacing: 0.85em)

// Section heading: large regular text with a rule underneath.
#show heading.where(level: 1): it => block(
  above: 28pt, below: 11pt, width: 100%,
  inset: (bottom: 5.5pt), stroke: (bottom: 0.4pt),
  text(size: 14pt, weight: "regular", it.body),
)

// Font Awesome 5 icon by codepoint.
#let icon(code, brand: false) = text(
  font: if brand { "Font Awesome 5 Brands" } else { "Font Awesome 5 Free Solid" },
  str.from-unicode(code),
)

// Entry: bold title with the date on the right, followed by details.
#let entry(title, date, body) = block(below: 2.2em)[
  #block(below: 0.9em, grid(columns: (1fr, auto), strong(title), date))
  #body
]

// Unbulleted line aligned with the bullet text.
#let note(body) = context block(above: 0.85em, pad(left: measure(bullet).width + 0.5em, body))

// --- Header ------------------------------------------------------------------

#let contacts = (
  link("https://linkedin.com/in/david-hoffmann-b7b51b228")[#icon(0xf08c, brand: true) David Hoffmann],
  link("mailto:d.hoffmann@protonmail.com")[#icon(0xf0e0) d.hoffmann\@protonmail.com],
  link("tel:+4917634503004")[#icon(0xf10b) +4917634503004],
)

#align(center, stack(
  spacing: 2em,
  text(size: 25pt)[David Sebastian Hoffmann],
  contacts.join[#h(0.8em)|#h(0.8em)],
))

// --- Content -----------------------------------------------------------------

= Summary

Full-Stack Software Engineer with more than 3 years of experience shipping distributed solutions for large-scale, highly reliable applications. I excel in a high-stakes, high-reward environment, and am adept at delivering impactful solutions with a focus on reliability and quality. My experience in international and collaborative development on large-scale software projects allows me to tackle big challenges with a perspective of long-term planning and ensuring timely delivery. My work prioritizes systemic quality and operational resilience, ensuring solutions not only meet user needs effectively but remain sustainable at scale. Currently applying this focus to build financial systems and warehouse operations for one of Europe's largest grocery chains.

= Work Experience

#entry[Lead Full-Stack Software Engineer at freiheit.com technologies][June 2023 – present][
  - Lead a team of software engineers building products for a distributed warehouse management platform in production across all markets of one of Europe's largest grocery chains.
  - Architected and shipped custom full-stack solutions in Go and TypeScript powering mission-critical systems for invoice processing, credit notes, and difference reconciliation. My solutions process millions of financial documents annually at enterprise scale.
  - Delivered multi-year, high-complexity projects on schedule while meeting stringent quality and reliability standards.
  #note[Technologies: Go, TypeScript, Vue.js, Azure]
]

#entry[Student Software Developer at NAVASTO GmbH][Oct 2021 – April 2023][
  - Coordinated the training, validation and integration of PyTorch models into a framework of cutting edge deep learning solutions for engineering design.
  #note[Technologies: Python, PyTorch, NumPy, Git, CUDA]
]

= Education

#entry[M.Sc. in Computer Science at TU Berlin][2020 – 2023][
  - Master Thesis on "Multi-Modal Vision Transformers for Multi-Label Remote Sensing Image Classification" (Grade:~1.0)
]

#entry[B.Sc. in Computer Science at TU Berlin][2016 – 2020][]

= Publications

#entry[Transformer-Based Multi-Modal Learning for Multi-Label Remote Sensing Image Classification][2023][
  *D. S. Hoffmann*, K. N. Clasen, B. Demir \
  _IEEE IGARSS 2023_, pp.~4891–4894 · #link("https://doi.org/10.1109/IGARSS52108.2023.10281927")[doi.org/10.1109/IGARSS52108.2023.10281927]
]

= Skills

#grid(
  columns: (auto, 1fr),
  [Programming Languages:], [Go, TypeScript, Python, C],
  [Tools:], [gRPC, Azure, Vue.js, PyTorch, Linux, Git],
  [Skills:], [Micro-service architectures, CI/CD, Machine Learning, Remote Sensing],
  [Soft Skills:], [Independent Problem Solving, Collaborative Development, Enthusiastic Learner, Critical Analysis, Reliable Maintainer],
  [Languages:], [English (fluent), German (native), Portuguese (basic level)],
)

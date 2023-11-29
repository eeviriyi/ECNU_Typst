// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(
  title: "",
  abstract: [],
  authors: (),
  date: none,
  body,
) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(numbering: "1", number-align: center)
  set text(font: "Family Song", lang: "zh")

  // Title row.
  align(center)[
    #block(text(weight: 700, 1.75em, title))
    #v(1em, weak: true)
  ]

  // Author information.
  pad(
    top: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center)[
        #author.name，
        #author.affiliation
      ]),
    ),
  )

  // Abstract.
  pad(
    x: 0em,
    top: 1em,
    bottom: 1.1em,
    align(left)[
      摘要：#abstract
    ],
  )

  // Main body.
  set par(justify: true)
  show: columns.with(2, gutter: 1.3em)

  body
}
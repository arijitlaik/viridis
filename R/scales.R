#' Viridis palette (discrete)
#'
#' Viridis palette (discrete)
#'
#' @details
#'
#' \if{html}{Here is an example of a 20-element palette:
#'
#'   \out{<div style="text-align: center">}\figure{sample-palette.png}{options: style="width:474px;max-width:90\%;"}\out{</div>}
#'
#'   }
#' \if{latex}{Here is an example of a 20-element palette:
#'
#'   \out{\begin{center}}\figure{samplepalette.pdf}\out{\end{center}}
#'   }
#'
#' See \link[viridisLite]{viridis} for more information on the color scale.
#'
#' @param alpha pass through parameter to \code{viridis}
#'
#' @param begin The (corrected) hue in [0,1] at which the viridis colormap begins.
#'
#' @param end The (corrected) hue in [0,1] at which the viridis colormap ends.
#'
#' @param direction Sets the order of colors in the scale. If 1, the default, colors
#' are ordered from darkest to lightest. If -1, the order of colors is reversed.
#'
#' @param option A character string indicating the colormap option to use. Four
#' options are available: "magma" (or "A"), "inferno" (or "B"), "plasma" (or "C"),
#' "viridis" (or "D", the default option) and "cividis" (or "E").
#'
#' @author Bob Rudis \email{bob@@rud.is}
#'
#' @examples
#' library(scales)
#' show_col(viridis_pal()(10))
#'
#' @importFrom viridisLite viridis
#'
#' @export
viridis_pal <- function(alpha = 1, begin = 0, end = 1, direction = 1, option= "D") {
  function(n) {
    viridisLite::viridis(n, alpha, begin, end, direction, option)
  }
}


#' @rdname scale_viridis
#'
#' @importFrom ggplot2 scale_fill_gradientn scale_color_gradientn discrete_scale
#'
#' @export
scale_color_viridis <- function(..., alpha = 1, begin = 0, end = 1, direction = 1,
                                discrete = FALSE, option = "D") {
  if (discrete) {
    discrete_scale("colour", "viridis", viridis_pal(alpha, begin, end, direction, option), ...)
  } else {
    scale_color_gradientn(colours = viridisLite::viridis(256, alpha, begin, end, direction, option), ...)
  }
}

#' @rdname scale_viridis
#' @aliases scale_color_viridis
#' @export
scale_colour_viridis <- scale_color_viridis

#' Viridis color scales
#'
#' Uses the viridis color scale.
#'
#' For \code{discrete == FALSE} (the default) all other arguments are as to
#' \link[ggplot2]{scale_fill_gradientn} or \link[ggplot2]{scale_color_gradientn}.
#' Otherwise the function will return a \code{discrete_scale} with the plot-computed
#' number of colors.
#'
#' See \link[viridisLite]{viridis} for more information on the color scale.
#'
#' @param ... parameters to \code{discrete_scale} or \code{scale_fill_gradientn}
#'
#' @param alpha pass through parameter to \code{viridis}
#'
#' @param begin The (corrected) hue in [0,1] at which the viridis colormap begins.
#'
#' @param end The (corrected) hue in [0,1] at which the viridis colormap ends.
#'
#' @param direction Sets the order of colors in the scale. If 1, the default, colors
#' are as output by \link[viridis]{viridis_pal}. If -1, the order of colors is reversed.
#'
#' @param discrete generate a discrete palette? (default: \code{FALSE} - generate continuous palette)
#'
#' @param option A character string indicating the colormap option to use. Four
#' options are available: "magma" (or "A"), "inferno" (or "B"), "plasma" (or "C"),
#' "viridis" (or "D", the default option) and "cividis" (or "E").
#'
#' @rdname scale_viridis
#'
#' @author Noam Ross \email{noam.ross@@gmail.com} / \href{https://twitter.com/noamross}{@@noamross} (continuous version),
#'         Bob Rudis \email{bob@@rud.is} / \href{https://twitter.com/hrbrmstr}{@@hrbrmstr} (combined version)
#'
#' @importFrom ggplot2 scale_fill_gradientn scale_color_gradientn discrete_scale
#'
#' @importFrom gridExtra grid.arrange
#'
#' @examples
#' library(ggplot2)
#'
#' # ripped from the pages of ggplot2
#' p <- ggplot(mtcars, aes(wt, mpg))
#' p + geom_point(size=4, aes(colour = factor(cyl))) +
#'     scale_color_viridis(discrete=TRUE) +
#'     theme_bw()
#'
#' # ripped from the pages of ggplot2
#' dsub <- subset(diamonds, x > 5 & x < 6 & y > 5 & y < 6)
#' dsub$diff <- with(dsub, sqrt(abs(x-y))* sign(x-y))
#' d <- ggplot(dsub, aes(x, y, colour=diff)) + geom_point()
#' d + scale_color_viridis() + theme_bw()
#'
#'
#' # from the main viridis example
#' dat <- data.frame(x = rnorm(10000), y = rnorm(10000))
#'
#' ggplot(dat, aes(x = x, y = y)) +
#'   geom_hex() + coord_fixed() +
#'   scale_fill_viridis() + theme_bw()
#'
#' library(ggplot2)
#' library(MASS)
#' library(gridExtra)
#'
#' data("geyser", package="MASS")
#'
#' ggplot(geyser, aes(x = duration, y = waiting)) +
#'   xlim(0.5, 6) + ylim(40, 110) +
#'   stat_density2d(aes(fill = ..level..), geom="polygon") +
#'   theme_bw() +
#'   theme(panel.grid=element_blank()) -> gg
#'
#' grid.arrange(
#'   gg + scale_fill_viridis(option="A") + labs(x="Virdis A", y=NULL),
#'   gg + scale_fill_viridis(option="B") + labs(x="Virdis B", y=NULL),
#'   gg + scale_fill_viridis(option="C") + labs(x="Virdis C", y=NULL),
#'   gg + scale_fill_viridis(option="D") + labs(x="Virdis D", y=NULL),
#'   gg + scale_fill_viridis(option="E") + labs(x="Virdis E", y=NULL),
#'   ncol=3, nrow=2
#' )
#'
#' @export
scale_fill_viridis <- function(..., alpha = 1, begin = 0, end = 1, direction = 1,
                               discrete = FALSE, option = "D") {
  if (discrete) {
    discrete_scale("fill", "viridis", viridis_pal(alpha, begin, end, direction, option), ...)
  } else {
    scale_fill_gradientn(colours = viridisLite::viridis(256, alpha, begin, end, direction, option), ...)
  }

}


#' @importFrom viridisLite viridis
#' @export
viridisLite::viridis

#' @importFrom viridisLite inferno
#' @export
viridisLite::inferno

#' @importFrom viridisLite magma
#' @export
viridisLite::magma

#' @importFrom viridisLite plasma
#' @export
viridisLite::plasma

#' @importFrom viridisLite cividis
#' @export
viridisLite::cividis

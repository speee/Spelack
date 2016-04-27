import gulp from 'gulp'
import webpack from 'gulp-webpack'
import webpackConfig from './webpack.config.js';
gulp.task('webpack', () => {
  gulp.src('app/assets/javascripts/**/*.js')
    .pipe(webpack(webpackConfig))
    .pipe(gulp.dest(webpackConfig.output.path));
});

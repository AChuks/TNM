/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import ReactOnRails from "react-on-rails";
import HomeComponent from "../bundles/components/HomeComponent";
// import './application.css'
import Header from '../bundles/Header/components/Header';
import SearchedVideos from "../bundles/components/SearchedVideos";
import VideosForm from "../bundles/components/VideosForm";
import ContactForm from "../bundles/components/ContactForm";
// import WatchVideos from "../bundles/components/WatchVideos";
// import Videos from "../bundles/components/Videos";
// import Users from "../bundles/components/Users";
// import UsersForm from "../bundles/components/UsersForm";

// const HomeComponent = React.lazy(() => import('../components/HomeComponent'));

ReactOnRails.register({
  // HomeComponent,
  Header,
  // SearchedVideos,
  // VideosForm,
  // ContactForm,
  // WatchVideos,
  // Videos,
  // Users,
  // UsersForm
});

/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import ReactOnRails from "react-on-rails";
import HomeComponent from "../components/HomeComponent";
import Header from "../components/Header";
import SearchedVideos from "../components/SearchedVideos";
import VideosForm from "../components/VideosForm";
import ContactForm from "../components/ContactForm";
import WatchVideos from "../components/WatchVideos";
import Videos from "../components/Videos";
import Users from "../components/Users";
import UsersForm from "../components/UsersForm";
ReactOnRails.register({
  HomeComponent,
  Header,
  SearchedVideos,
  VideosForm,
  ContactForm,
  WatchVideos,
  Videos,
  Users,
  UsersForm
});

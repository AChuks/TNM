import ReactOnRails from "react-on-rails";
import Header from "../bundles/components/Header";
import HomeComponent from "../bundles/components/HomeComponent";
import SearchedVideos from "../bundles/components/SearchedVideos";
import VideosForm from "../bundles/components/VideosForm";
import ContactForm from "../bundles/components/ContactForm";
import WatchVideos from "../bundles/components/WatchVideos";
import Videos from "../bundles/components/Videos";
import Users from "../bundles/components/Users";
import UsersForm from "../bundles/components/UsersForm";


ReactOnRails.register({
    Header,
    HomeComponent,
    SearchedVideos,
    VideosForm,
    ContactForm,
    WatchVideos,
    Videos,
    Users,
    UsersForm
});
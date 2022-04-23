// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.elements._SafeStr_3490

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;

    public class _SafeStr_3490 
    {

        public static const CAPTION:String = "caption";
        public static const TITLE:String = "title";
        public static const _SafeStr_8556:String = "subcaption";
        public static const BODYTEXT:String = "bodytext";
        public static const SPACING:String = "spacing";
        public static const CATALOGBUTTON:String = "catalogbutton";
        public static const PROMOTEDROOMBUTTON:String = "promotedroombutton";
        public static const LINK:String = "link";
        public static const _SafeStr_8557:String = "gotoroombutton";
        public static const REQUESTBADGEBUTTON:String = "requestbadgebutton";
        public static const REQUESTBADGEBUTTONSECOND:String = "requestbadgebuttonsecond";
        public static const REQUESTBADGEBUTTONTHIRD:String = "requestbadgebuttonthird";
        public static const REQUESTBADGEBUTTONFOURTH:String = "requestbadgebuttonfourth";
        public static const REQUESTBADGEBUTTONFIFTH:String = "requestbadgebuttonfifth";
        public static const CREDITHABBLETBUTTON:String = "credithabbletbutton";
        public static const COMMUNITYGOALTIMER:String = "communitygoaltimer";
        public static const CUSTOMTIMER:String = "customtimer";
        public static const _SafeStr_8558:String = "gotohomeroombutton";
        public static const _SafeStr_8559:String = "gotocompetitionroombutton";
        public static const REWARDBADGE:String = "rewardbadge";
        public static const IMAGE:String = "image";
        public static const SUBMITCOMPETITIONROOM:String = "submitcompetitionroom";
        public static const CONCURRENTUSERSMETER:String = "concurrentusersmeter";
        public static const CONCURRENTUSERSINFO:String = "concurrentusersinfo";
        public static const DAILYQUEST:String = "dailyquest";
        public static const _SafeStr_8560:String = "buyvipbutton";
        public static const COMMUNITYGOALSCORE:String = "communitygoalscore";
        public static const INTERNAL_LINK_BUTTON:String = "internallinkbutton";


        public static function createHandler(_arg_1:String):IElementHandler
        {
            switch (_arg_1)
            {
                case "caption":
                case "subcaption":
                case "bodytext":
                    return (new _SafeStr_3492());
                case "title":
                    return (new TitleElementHandler());
                case "spacing":
                    return (new _SafeStr_3497());
                case "catalogbutton":
                    return (new CatalogButtonElementHandler());
                case "promotedroombutton":
                    return (new _SafeStr_3508());
                case "link":
                    return (new _SafeStr_3500());
                case "gotoroombutton":
                    return (new _SafeStr_3507());
                case "requestbadgebutton":
                case "requestbadgebuttonsecond":
                case "requestbadgebuttonthird":
                case "requestbadgebuttonfourth":
                case "requestbadgebuttonfifth":
                    return (new _SafeStr_3503());
                case "credithabbletbutton":
                    return (new _SafeStr_3495());
                case "communitygoaltimer":
                    return (new _SafeStr_3504());
                case "customtimer":
                    return (new _SafeStr_3502());
                case "gotohomeroombutton":
                    return (new _SafeStr_3496());
                case "gotocompetitionroombutton":
                    return (new _SafeStr_3505());
                case "rewardbadge":
                    return (new _SafeStr_3493());
                case "image":
                    return (new _SafeStr_3511());
                case "submitcompetitionroom":
                    return (new _SafeStr_3509());
                case "concurrentusersmeter":
                    return (new _SafeStr_3512());
                case "concurrentusersinfo":
                    return (new ConcurrentUsersInfoElementHandler());
                case "dailyquest":
                    return (new _SafeStr_3506());
                case "buyvipbutton":
                    return (new _SafeStr_3510());
                case "communitygoalscore":
                    return (new _SafeStr_3498());
                case "internallinkbutton":
                    return (new _SafeStr_3499());
            };
            return (null);
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_3490 = "_-tE" (String#18035, DoABC#4)
// _SafeStr_3492 = "_-c9" (String#8571, DoABC#4)
// _SafeStr_3493 = "_-21x" (String#14761, DoABC#4)
// _SafeStr_3495 = "_-CS" (String#14160, DoABC#4)
// _SafeStr_3496 = "_-65" (String#14712, DoABC#4)
// _SafeStr_3497 = "_-W1f" (String#14171, DoABC#4)
// _SafeStr_3498 = "_-kt" (String#15145, DoABC#4)
// _SafeStr_3499 = "_-qh" (String#14037, DoABC#4)
// _SafeStr_3500 = "_-3e" (String#15010, DoABC#4)
// _SafeStr_3502 = "_-D1j" (String#13922, DoABC#4)
// _SafeStr_3503 = "_-c1m" (String#13886, DoABC#4)
// _SafeStr_3504 = "_-Uj" (String#15332, DoABC#4)
// _SafeStr_3505 = "_-A1W" (String#15486, DoABC#4)
// _SafeStr_3506 = "_-Yx" (String#14198, DoABC#4)
// _SafeStr_3507 = "_-V2" (String#14075, DoABC#4)
// _SafeStr_3508 = "_-76" (String#15730, DoABC#4)
// _SafeStr_3509 = "_-02q" (String#15034, DoABC#4)
// _SafeStr_3510 = "_-T16" (String#14511, DoABC#4)
// _SafeStr_3511 = "_-n1Y" (String#14136, DoABC#4)
// _SafeStr_3512 = "_-w6" (String#14609, DoABC#4)
// _SafeStr_8556 = "_-E1m" (String#32387, DoABC#4)
// _SafeStr_8557 = "_-PF" (String#39360, DoABC#4)
// _SafeStr_8558 = "_-11y" (String#35218, DoABC#4)
// _SafeStr_8559 = "_-pD" (String#32194, DoABC#4)
// _SafeStr_8560 = "_-21I" (String#33983, DoABC#4)



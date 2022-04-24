// by nota

//com.sulake.habbo.help.guidehelp.GuideSessionData

package com.sulake.habbo.help.guidehelp
{
    public class GuideSessionData 
    {

        public static const ROLE_UNDECIDED:uint = 0;
        public static const ROLE_GUIDE:uint = 1;
        public static const ROLE_USER:uint = 2;
        public static const _SafeStr_8624:int = 0;
        public static const _SafeStr_8625:int = 1;
        public static const _SafeStr_8626:int = 2;

        private var _SafeStr_6814:uint = 0;
        private var _SafeStr_6815:String = "";
        private var _SafeStr_4312:uint = 0;
        private var _requestDescription:String = "";
        private var _SafeStr_4128:uint = 0;
        private var _userName:String = "";
        private var _SafeStr_6816:String = "";
        private var _SafeStr_4116:uint = 0;
        private var _guideName:String = "";
        private var _SafeStr_6817:String = "";


        public function isActiveSession():Boolean
        {
            return ((isActiveUserSession()) || (isActiveGuideSession()));
        }

        public function isActiveUserSession():Boolean
        {
            return ((_SafeStr_6814 == 2) && ((((_SafeStr_6815 == "user_create") || (_SafeStr_6815 == "user_pending")) || (_SafeStr_6815 == "user_ongoing")) || (_SafeStr_6815 == "user_feedback")));
        }

        public function isActiveGuideSession():Boolean
        {
            return ((_SafeStr_6814 == 1) && (((_SafeStr_6815 == "guide_accept") || (_SafeStr_6815 == "guide_ongoing")) || (_SafeStr_6815 == "guide_closed")));
        }

        public function isOnGoingSession():Boolean
        {
            return ((_SafeStr_6815 == "guide_ongoing") || (_SafeStr_6815 == "user_ongoing"));
        }

        public function set role(_arg_1:uint):void
        {
            _SafeStr_6814 = _arg_1;
        }

        public function get activeWindow():String
        {
            return (_SafeStr_6815);
        }

        public function set activeWindow(_arg_1:String):void
        {
            _SafeStr_6815 = _arg_1;
        }

        public function get requestType():uint
        {
            return (_SafeStr_4312);
        }

        public function set requestType(_arg_1:uint):void
        {
            _SafeStr_4312 = _arg_1;
        }

        public function get requestDescription():String
        {
            return (_requestDescription);
        }

        public function set requestDescription(_arg_1:String):void
        {
            _requestDescription = _arg_1;
        }

        public function get userId():uint
        {
            return (_SafeStr_4128);
        }

        public function set userId(_arg_1:uint):void
        {
            _SafeStr_4128 = _arg_1;
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function set userName(_arg_1:String):void
        {
            _userName = _arg_1;
        }

        public function get userFigure():String
        {
            return (_SafeStr_6816);
        }

        public function set userFigure(_arg_1:String):void
        {
            _SafeStr_6816 = _arg_1;
        }

        public function get guideId():uint
        {
            return (_SafeStr_4116);
        }

        public function set guideId(_arg_1:uint):void
        {
            _SafeStr_4116 = _arg_1;
        }

        public function get guideName():String
        {
            return (_guideName);
        }

        public function set guideName(_arg_1:String):void
        {
            _guideName = _arg_1;
        }

        public function get guideFigure():String
        {
            return (_SafeStr_6817);
        }

        public function set guideFigure(_arg_1:String):void
        {
            _SafeStr_6817 = _arg_1;
        }


    }
}//package com.sulake.habbo.help.guidehelp

// _SafeStr_4116 = "_-vJ" (String#6534, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_4312 = "_-Y1J" (String#4374, DoABC#4)
// _SafeStr_6814 = "_-J18" (String#15634, DoABC#4)
// _SafeStr_6815 = "_-QZ" (String#5628, DoABC#4)
// _SafeStr_6816 = "_-KF" (String#18811, DoABC#4)
// _SafeStr_6817 = "_-L1F" (String#22890, DoABC#4)
// _SafeStr_8624 = "_-D3" (String#39747, DoABC#4)
// _SafeStr_8625 = "_-j1c" (String#36726, DoABC#4)
// _SafeStr_8626 = "_-aZ" (String#31743, DoABC#4)



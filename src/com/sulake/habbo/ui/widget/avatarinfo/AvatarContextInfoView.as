// by nota

//com.sulake.habbo.ui.widget.avatarinfo.AvatarContextInfoView

package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.habbo.ui.widget.contextmenu.ContextInfoView;
    import com.sulake.habbo.ui.widget.contextmenu._SafeStr_3149;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import flash.geom.Rectangle;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.friendlist._SafeStr_3259;

    public class AvatarContextInfoView extends ContextInfoView 
    {

        protected var _SafeStr_4128:int;
        protected var _userName:String;
        protected var _SafeStr_5420:int;
        protected var _SafeStr_5537:Boolean;
        protected var _SafeStr_5536:int;

        public function AvatarContextInfoView(_arg_1:_SafeStr_3149)
        {
            super(_arg_1);
            _SafeStr_4981 = (_arg_1 as AvatarInfoWidget);
        }

        public static function setup(_arg_1:AvatarContextInfoView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:Boolean=false):void
        {
            _arg_1._SafeStr_4128 = _arg_2;
            _arg_1._userName = _arg_3;
            _arg_1._SafeStr_5420 = _arg_5;
            _arg_1._SafeStr_5536 = _arg_4;
            _arg_1._SafeStr_5537 = _arg_6;
            setupContext(_arg_1);
        }


        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get userType():int
        {
            return (_SafeStr_5420);
        }

        public function get roomIndex():int
        {
            return (_SafeStr_5536);
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function get allowNameChange():Boolean
        {
            return (_SafeStr_5537);
        }

        override protected function updateWindow():void
        {
            var _local_1:* = null;
            if ((((!(_SafeStr_4981)) || (!(_SafeStr_4981.assets))) || (!(_SafeStr_4981.windowManager))))
            {
                return;
            };
            if (!_window)
            {
                _local_1 = (_SafeStr_4981.assets.getAssetByName("avatar_info_widget").content as XML);
                _window = (_SafeStr_4981.windowManager.buildFromXML(_local_1, 0) as _SafeStr_3133);
                if (!_window)
                {
                    return;
                };
            };
            var _local_2:_SafeStr_3109 = _window.findChildByName("name");
            _local_2.caption = _userName;
            updateRelationshipStatus();
            _window.findChildByName("change_name_container").visible = false;
            _window.height = 39;
            activeView = _window;
        }

        override protected function getOffset(_arg_1:Rectangle):int
        {
            var _local_2:int = -(_SafeStr_5531.height);
            if (((_SafeStr_5420 == 1) || (_SafeStr_5420 == 3)))
            {
                _local_2 = (_local_2 + ((_arg_1.height > 50) ? 25 : 0));
            }
            else
            {
                _local_2 = (_local_2 - 4);
            };
            return (_local_2);
        }

        protected function updateRelationshipStatus():void
        {
            var _local_1:* = null;
            if (((_SafeStr_4981) && (_SafeStr_4981.friendList)))
            {
                _local_1 = IStaticBitmapWrapperWindow(_window.findChildByName("relationship_status"));
                _local_1.assetUri = ("relationship_status_" + _SafeStr_3259.statusAsString(_SafeStr_4981.friendList.getRelationshipStatus(userId)));
            };
        }


    }
}//package com.sulake.habbo.ui.widget.avatarinfo

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3149 = "_-qk" (String#4158, DoABC#4)
// _SafeStr_3259 = "_-CW" (String#5979, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5420 = "_-S13" (String#2704, DoABC#4)
// _SafeStr_5531 = "_-V14" (String#2652, DoABC#4)
// _SafeStr_5536 = "_-517" (String#2777, DoABC#4)
// _SafeStr_5537 = "_-wn" (String#3638, DoABC#4)



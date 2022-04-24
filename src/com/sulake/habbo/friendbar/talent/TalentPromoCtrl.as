// by nota

//com.sulake.habbo.friendbar.talent.TalentPromoCtrl

package com.sulake.habbo.friendbar.talent
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import _-yL._SafeStr_528;
    import _-Y1c._SafeStr_1037;
    import _-Y1c._SafeStr_368;
    import _-f1P._SafeStr_320;
    import _-t1I._SafeStr_1229;
    import _-t1I._SafeStr_1086;
    import _-f1P._SafeStr_953;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class TalentPromoCtrl implements _SafeStr_13 
    {

        private static const BG_COLOR_LIGHT:uint = 4286084205;
        private static const BG_COLOR_DARK:uint = 4283781966;

        private var _SafeStr_4144:HabboTalent;
        private var _window:_SafeStr_3133;
        private var _SafeStr_3623:int;
        private var _SafeStr_6073:int;
        private var _SafeStr_4155:int;

        public function TalentPromoCtrl(_arg_1:HabboTalent)
        {
            _SafeStr_4144 = _arg_1;
        }

        public function dispose():void
        {
            if (toolbarAttachAllowed())
            {
                _SafeStr_4144.toolbar.extensionView.detachExtension("talent_promo");
            };
            _SafeStr_4144 = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4144 == null);
        }

        public function initialize():void
        {
            if (!enabled)
            {
                return;
            };
            _SafeStr_4144.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_528(onUserObject));
            _SafeStr_4144.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_1037(onTalentTrackLevel));
            _SafeStr_4144.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_368(onTalentLevelUp));
        }

        private function onUserObject(_arg_1:_SafeStr_528):void
        {
            _SafeStr_4144.send(new _SafeStr_320(promotedTalentTrack));
        }

        private function onTalentTrackLevel(_arg_1:_SafeStr_1037):void
        {
            var _local_2:_SafeStr_1229 = _arg_1.getParser();
            if (_local_2.talentTrackName == promotedTalentTrack)
            {
                _SafeStr_6073 = _local_2.maxLevel;
                _SafeStr_3623 = _local_2.level;
                refresh();
            };
        }

        private function onTalentLevelUp(_arg_1:_SafeStr_368):void
        {
            var _local_2:_SafeStr_1086 = _arg_1.getParser();
            if (_local_2.talentTrackName == promotedTalentTrack)
            {
                _SafeStr_3623 = _local_2.level;
                refresh();
            };
        }

        private function refresh():void
        {
            if (((!(enabled)) || (maxLevelReached)))
            {
                close();
                return;
            };
            prepareWindow();
            setText("title");
            _window.x = 0;
            _window.y = 0;
            if (toolbarAttachAllowed())
            {
                _SafeStr_4144.toolbar.extensionView.attachExtension("talent_promo", _window, 7);
            };
        }

        private function setText(_arg_1:String):void
        {
            _window.findChildByName((_arg_1 + "_txt")).caption = (((("${talentpromo." + promotedTalentTrack) + ".") + _arg_1) + "}");
        }

        private function prepareWindow():void
        {
            if (this._window != null)
            {
                return;
            };
            _window = _SafeStr_3133(_SafeStr_4144.getXmlWindow("track_promo"));
            _window.addEventListener("WME_CLICK", onCheckProgress);
            _window.addEventListener("WME_OVER", onContainerMouseOver);
            _window.addEventListener("WME_OUT", onContainerMouseOut);
            _SafeStr_4155 = _window.height;
        }

        public function close():void
        {
            if (_window != null)
            {
                if (toolbarAttachAllowed())
                {
                    _SafeStr_4144.toolbar.extensionView.detachExtension("talent_promo");
                };
            };
        }

        private function onCheckProgress(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109=null):void
        {
            if (((_arg_1.type == "WME_CLICK") && (enabled)))
            {
                _SafeStr_4144.tracking.trackTalentTrackOpen(promotedTalentTrack, "talentpromo");
                _SafeStr_4144.send(new _SafeStr_953(promotedTalentTrack));
            };
        }

        private function toolbarAttachAllowed():Boolean
        {
            return ((((!(_SafeStr_4144 == null)) && (!(_SafeStr_4144.toolbar == null))) && (!(_SafeStr_4144.toolbar.extensionView == null))) && (enabled));
        }

        private function get enabled():Boolean
        {
            return (!(promotedTalentTrack == ""));
        }

        private function get promotedTalentTrack():String
        {
            return (_SafeStr_4144.getProperty("talentpromo.track"));
        }

        private function get maxLevelReached():Boolean
        {
            return (_SafeStr_3623 >= _SafeStr_6073);
        }

        private function onContainerMouseOver(_arg_1:WindowMouseEvent):void
        {
            _window.findChildByTag("BGCOLOR").color = 4286084205;
        }

        private function onContainerMouseOut(_arg_1:WindowMouseEvent):void
        {
            _window.findChildByTag("BGCOLOR").color = 4283781966;
        }


    }
}//package com.sulake.habbo.friendbar.talent

// _SafeStr_1037 = "_-2u" (String#24282, DoABC#4)
// _SafeStr_1086 = "_-Z1y" (String#31146, DoABC#4)
// _SafeStr_1229 = "_-J1x" (String#38776, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_320 = "_-o1p" (String#29114, DoABC#4)
// _SafeStr_3623 = "_-OF" (String#2491, DoABC#4)
// _SafeStr_368 = "_-p1" (String#13804, DoABC#4)
// _SafeStr_4144 = "_-n1T" (String#228, DoABC#4)
// _SafeStr_4155 = "_-C1K" (String#6965, DoABC#4)
// _SafeStr_528 = "_-MO" (String#2024, DoABC#4)
// _SafeStr_6073 = "_-Ga" (String#22541, DoABC#4)
// _SafeStr_953 = "_-a1w" (String#3282, DoABC#4)



// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.elements._SafeStr_3506

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements._SafeStr_3491;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import com.sulake.core.window._SafeStr_3133;
    import _-41O._SafeStr_1607;
    import _-41O._SafeStr_912;
    import com.sulake.core.window._SafeStr_3109;
    import _-61d._SafeStr_985;
    import _-3D._SafeStr_1278;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-61d._SafeStr_410;
    import _-61d._SafeStr_775;

    public class _SafeStr_3506 implements IElementHandler, _SafeStr_3491, _SafeStr_13 
    {

        private var _landingView:HabboLandingView;
        private var _SafeStr_4981:GenericWidget;
        private var _window:_SafeStr_3133;
        private var _container:_SafeStr_3133;
        private var _SafeStr_3740:_SafeStr_1607;
        private var _SafeStr_6958:int;
        private var _SafeStr_6959:int;
        private var _index:int;
        private var _SafeStr_6999:Boolean = false;
        private var _disposed:Boolean = false;
        private var _SafeStr_7078:String = "";
        private var _SafeStr_7087:String = "";


        public static function moveChildrenToRow(_arg_1:_SafeStr_3133, _arg_2:int):void
        {
            var _local_3:int;
            var _local_5:* = null;
            var _local_4:int;
            _local_3 = 0;
            while (_local_3 < _arg_1.numChildren)
            {
                _local_5 = _arg_1.getChildAt(_local_3);
                _local_5.x = _local_4;
                _local_4 = (_local_4 + (_local_5.width + _arg_2));
                _local_3++;
            };
        }


        public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            _SafeStr_4981 = _arg_4;
            _landingView = _arg_1;
            _window = (_arg_2 as _SafeStr_3133);
            if (_arg_3.length > 2)
            {
                _SafeStr_6999 = (_arg_3[2] == "true");
            };
            if (_arg_3.length > 3)
            {
                _arg_2.x = _arg_3[3];
            };
            if (_arg_3.length > 4)
            {
                _arg_2.y = _arg_3[4];
            };
            if (_arg_3.length > 5)
            {
                _SafeStr_7078 = _arg_3[5];
            };
            if (_arg_3.length > 6)
            {
                _SafeStr_7087 = _arg_3[6];
            };
            _arg_1.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_912(onDailyQuest));
            _container = (_arg_2 as _SafeStr_3133);
            _container.findChildByName("accept_button").procedure = onAcceptButton;
            _container.findChildByName("go_button").procedure = onGoButton;
            _container.findChildByName("next_quest_region").procedure = onNextQuest;
            _container.findChildByName("cancel_quest_region").procedure = onCancelQuest;
            _container.findChildByName("easy_region").procedure = onEasyRegion;
            _container.findChildByName("hard_region").procedure = onHardRegion;
        }

        public function dispose():void
        {
            _landingView = null;
            _disposed = true;
        }

        public function isFloating(_arg_1:Boolean):Boolean
        {
            return (_SafeStr_6999);
        }

        public function refresh():void
        {
            _index = 0;
            _landingView.send(new _SafeStr_985(true, 0));
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        private function onDailyQuest(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1278 = _SafeStr_1278(_arg_1.parser);
            _SafeStr_3740 = _local_2.quest;
            _SafeStr_6958 = _local_2.easyQuestCount;
            _SafeStr_6959 = _local_2.hardQuestCount;
            refreshContent();
        }

        private function refreshContent():void
        {
            _container.findChildByName("caption_txt").caption = ((_SafeStr_3740) ? getChainSpecificText("chaincaption") : getText("landing.view.quest.currenttask.alldone.caption"));
            _container.findChildByName("accept_button").visible = ((_SafeStr_3740) && (!(_SafeStr_3740.accepted)));
            _container.findChildByName("next_quest_region").visible = (((_SafeStr_3740) && (!(_SafeStr_3740.accepted))) && (((_SafeStr_3740.easy) ? _SafeStr_6958 : _SafeStr_6959) > 1));
            _container.findChildByName("next_quest_txt").caption = getText(("landing.view.quest.nextquest." + (((_SafeStr_3740) && (_SafeStr_3740.easy)) ? "easy" : "hard")));
            _container.findChildByName("cancel_quest_region").visible = ((_SafeStr_3740) && (_SafeStr_3740.accepted));
            _container.findChildByName("current_quest_border").visible = ((_SafeStr_3740) && (_SafeStr_3740.accepted));
            if (_SafeStr_3740)
            {
                _landingView.localizationManager.registerParameter("landing.view.quest.currenttask", "task", getQuestName());
            };
            var _local_1:_SafeStr_3133 = _SafeStr_3133(_container.findChildByName("difficulty_container"));
            var _local_2:int = (_local_1.x + _local_1.width);
            _local_1.visible = ((((_SafeStr_3740) && (!(_SafeStr_3740.accepted))) && (_SafeStr_6958 > 0)) && (_SafeStr_6959 > 0));
            setupDifficultyText("easy_region", ((_SafeStr_3740) && (!(_SafeStr_3740.easy))));
            setupDifficultyText("hard_region", ((_SafeStr_3740) && (_SafeStr_3740.easy)));
            moveChildrenToRow(_local_1, 5);
            _local_1.width = (_local_1.findChildByName("hard_region").x + _local_1.findChildByName("hard_region").width);
            _local_1.x = (_local_2 - _local_1.width);
        }

        private function setupDifficultyText(_arg_1:String, _arg_2:Boolean):void
        {
            var _local_4:_SafeStr_3133 = _SafeStr_3133(_container.findChildByName(_arg_1));
            var _local_3:ITextWindow = ITextWindow(_local_4.findChildByName("label_txt"));
            _local_3.width = _local_3.textWidth;
            _local_3.underline = _arg_2;
            _local_4.width = _local_3.width;
        }

        private function getChainSpecificKey(_arg_1:String):String
        {
            return ((((("quests." + _SafeStr_3740.campaignCode) + ".") + _SafeStr_3740.chainCode) + ".") + _arg_1);
        }

        private function getChainSpecificText(_arg_1:String):String
        {
            var _local_2:String = getChainSpecificKey(_arg_1);
            return (("${" + _local_2) + "}");
        }

        private function getText(_arg_1:String):String
        {
            return (("${" + _arg_1) + "}");
        }

        private function onGoButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _landingView.goToRoom();
            };
        }

        private function onEasyRegion(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                sendGetDailyQuest(true);
            };
        }

        private function onHardRegion(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                sendGetDailyQuest(false);
            };
        }

        public function getQuestName():String
        {
            var _local_1:String = (_SafeStr_3740.getQuestLocalizationKey() + ".name");
            return (("${" + _local_1) + "}");
        }

        private function onAcceptButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _landingView.send(new _SafeStr_410(_SafeStr_3740.id));
            };
        }

        private function onNextQuest(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _index++;
                sendGetDailyQuest(_SafeStr_3740.easy);
            };
        }

        private function onCancelQuest(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _landingView.send(new _SafeStr_775());
            };
        }

        private function sendGetDailyQuest(_arg_1:Boolean):void
        {
            _landingView.send(new _SafeStr_985(_arg_1, _index));
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_1278 = "_-rQ" (String#18025, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1607 = "_-oH" (String#1847, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3491 = "_-4A" (String#6633, DoABC#4)
// _SafeStr_3506 = "_-Yx" (String#14198, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_410 = "_-51e" (String#9595, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_6958 = "_-d1z" (String#7220, DoABC#4)
// _SafeStr_6959 = "_-K7" (String#7299, DoABC#4)
// _SafeStr_6999 = "_-Q13" (String#9875, DoABC#4)
// _SafeStr_7078 = "_-o9" (String#23718, DoABC#4)
// _SafeStr_7087 = "_-Z8" (String#24887, DoABC#4)
// _SafeStr_775 = "_-bD" (String#18982, DoABC#4)
// _SafeStr_912 = "_-e17" (String#16454, DoABC#4)
// _SafeStr_985 = "_-Kw" (String#9166, DoABC#4)



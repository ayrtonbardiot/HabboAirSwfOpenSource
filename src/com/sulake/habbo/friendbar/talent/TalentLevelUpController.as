// by nota

//com.sulake.habbo.friendbar.talent.TalentLevelUpController

package com.sulake.habbo.friendbar.talent
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import _-Y1c._SafeStr_368;
    import _-t1I._SafeStr_1086;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import _-t1I._SafeStr_1646;
    import _-t1I._SafeStr_1591;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.core.window.components._SafeStr_3199;
    import _-f1P._SafeStr_953;
    import com.sulake.core.window.events._SafeStr_3116;

    public class TalentLevelUpController implements _SafeStr_13 
    {

        private var _habboTalent:HabboTalent;
        private var _disposed:Boolean;
        private var _window:_SafeStr_3133;
        private var _SafeStr_5569:String;
        private var _SafeStr_5567:_SafeStr_3109;
        private var _SafeStr_5568:_SafeStr_3109;
        private var _SafeStr_5566:_SafeStr_3109;

        public function TalentLevelUpController(_arg_1:HabboTalent)
        {
            _habboTalent = _arg_1;
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_SafeStr_5566 != null)
                {
                    _SafeStr_5566.dispose();
                    _SafeStr_5566 = null;
                };
                if (_SafeStr_5567 != null)
                {
                    _SafeStr_5567.dispose();
                    _SafeStr_5567 = null;
                };
                if (_SafeStr_5568 != null)
                {
                    _SafeStr_5568.dispose();
                    _SafeStr_5568 = null;
                };
                closeWindow();
                _habboTalent = null;
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function initialize():void
        {
            _habboTalent.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_368(onTalentLevelUp));
        }

        private function onTalentLevelUp(_arg_1:_SafeStr_368):void
        {
            var _local_2:_SafeStr_1086 = _arg_1.getParser();
            if ((((_local_2.level == 1) && (_local_2.talentTrackName == "helper")) && (_habboTalent.citizenshipEnabled)))
            {
                return;
            };
            showWindow(_local_2.talentTrackName, _local_2.level, _local_2.rewardPerks, _local_2.rewardProducts);
        }

        public function showWindow(_arg_1:String, _arg_2:int, _arg_3:Vector.<_SafeStr_1646>, _arg_4:Vector.<_SafeStr_1591>):void
        {
            closeWindow();
            _SafeStr_5569 = _arg_1;
            _window = (_habboTalent.getXmlWindow("level_up") as _SafeStr_3133);
            _window.center();
            _window.procedure = onWindowEvent;
            IStaticBitmapWrapperWindow(_window.findChildByName("level_decoration")).assetUri = (((("${image.library.url}talent/" + _arg_1) + "_levelup_") + _arg_2) + ".png");
            _window.findChildByName("level_up_message").caption = (("${talent.track." + _arg_1) + ".levelup.message}");
            _window.findChildByName("level_title").caption = (((("${talent.track." + _arg_1) + ".level.") + _arg_2) + ".title}");
            _window.findChildByName("level_description").caption = (((("${talent.track." + _arg_1) + ".level.") + _arg_2) + ".description}");
            var _local_8:IItemListWindow = IItemListWindow(_window.findChildByName("reward_list"));
            var _local_6:_SafeStr_3109 = _local_8.removeListItem(_local_8.getListItemByName("plus_template"));
            _SafeStr_5567 = _local_8.removeListItem(_local_8.getListItemByName("reward_product_template"));
            _SafeStr_5568 = _local_8.removeListItem(_local_8.getListItemByName("reward_vip_template"));
            _SafeStr_5566 = _local_8.removeListItem(_local_8.getListItemByName("reward_perk_template"));
            var _local_7:Boolean;
            for each (var _local_5:_SafeStr_1646 in _arg_3)
            {
                if (_local_7)
                {
                    _local_8.addListItem(_local_6.clone());
                };
                _local_8.addListItem(createRewardPerk(_local_5));
                _local_7 = true;
            };
            for each (var _local_9:_SafeStr_1591 in _arg_4)
            {
                if (_local_7)
                {
                    _local_8.addListItem(_local_6.clone());
                };
                _local_8.addListItem(createRewardProduct(_local_9));
                _local_7 = true;
            };
            if (_local_8.numListItems < 1)
            {
                _window.findChildByName("level_rewards").visible = false;
                IItemListWindow(_window.findChildByName("level_up_layout")).arrangeListItems();
            };
        }

        private function createRewardPerk(_arg_1:_SafeStr_1646):_SafeStr_3109
        {
            var _local_2:_SafeStr_3133 = (_SafeStr_5566.clone() as _SafeStr_3133);
            _SafeStr_3349(_SafeStr_3199(_local_2.findChildByName("perk_image")).widget).badgeId = _arg_1.perkId;
            _local_2.findChildByName("perk_name").caption = (("${perk." + _arg_1.perkId) + ".name}");
            return (_local_2);
        }

        private function createRewardProduct(_arg_1:_SafeStr_1591):_SafeStr_3109
        {
            var _local_2:* = null;
            if (_arg_1.vipDays == 0)
            {
                _local_2 = _SafeStr_5567.clone();
                IStaticBitmapWrapperWindow(_local_2).assetUri = (("${image.library.url}talent/reward_product_" + _arg_1.productCode.toLowerCase().replace(" ", "_")) + ".png");
            }
            else
            {
                _local_2 = _SafeStr_5568.clone();
                _SafeStr_3133(_local_2).findChildByName("vip_length").caption = _habboTalent.localizationManager.getLocalizationWithParams("catalog.vip.item.header.days", "", "num_days", _arg_1.vipDays);
            };
            return (_local_2);
        }

        private function closeWindow():void
        {
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
        }

        private function onWindowEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if ((((_window == null) || (_window.disposed)) || (!(_arg_1.type == "WME_CLICK"))))
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "header_button_close":
                case "close_button":
                    closeWindow();
                    return;
                case "talent_button":
                    closeWindow();
                    _habboTalent.tracking.trackTalentTrackOpen(_SafeStr_5569, "levelup");
                    _habboTalent.send(new _SafeStr_953(_SafeStr_5569));
                    return;
            };
        }


    }
}//package com.sulake.habbo.friendbar.talent

// _SafeStr_1086 = "_-Z1y" (String#31146, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1591 = "_-e1N" (String#15028, DoABC#4)
// _SafeStr_1646 = "_-o1n" (String#14423, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_368 = "_-p1" (String#13804, DoABC#4)
// _SafeStr_5566 = "_-N1h" (String#9694, DoABC#4)
// _SafeStr_5567 = "_-lB" (String#4649, DoABC#4)
// _SafeStr_5568 = "_-M12" (String#4591, DoABC#4)
// _SafeStr_5569 = "_-t18" (String#15100, DoABC#4)
// _SafeStr_953 = "_-a1w" (String#3282, DoABC#4)



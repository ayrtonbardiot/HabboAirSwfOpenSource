// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes._SafeStr_3440

package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
    import com.sulake.core.window._SafeStr_3133;
    import _-l12._SafeStr_1554;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.components._SafeStr_3158;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window.components.ISelectorWindow;
    import flash.events.Event;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.roomevents.Util;

    public class _SafeStr_3440 extends DefaultActionType 
    {

        private const MAX_REWARDS:int = 20;

        private var _roomEvents:HabboUserDefinedRoomEvents;
        private var _SafeStr_6721:SliderWindowController;
        private var _SafeStr_6722:int = 5;


        override public function get code():int
        {
            return (_SafeStr_3485.GIVE_REWARD);
        }

        override public function validate(_arg_1:_SafeStr_3133, _arg_2:HabboUserDefinedRoomEvents):String
        {
            var _local_5:int;
            var _local_4:* = null;
            var _local_6:* = null;
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_arg_1.findChildByName("rewards_container"));
            var _local_7:int;
            _local_5 = 0;
            while (_local_5 < _local_3.numChildren)
            {
                _local_4 = _SafeStr_3133(_local_3.getChildAt(_local_5));
                if (_local_4.visible)
                {
                    _local_6 = validateReward(_local_4, getUniquePrizeCheckBox(_arg_1).isSelected);
                    if (_local_6 != null)
                    {
                        return (_local_6);
                    };
                    _local_7 = (_local_7 + getPropabilityInput(_local_4).text);
                };
                _local_5++;
            };
            if (_local_7 > 100)
            {
                return (("The sum of probabilities cannot exceed 100. You now have " + _local_7) + ".");
            };
            return (null);
        }

        override public function readIntParamsFromForm(_arg_1:_SafeStr_3133):Array
        {
            var _local_2:Array = [];
            _local_2.push(getUserRewardIntervalSelector(_arg_1).getSelected().id);
            _local_2.push(((getUniquePrizeCheckBox(_arg_1).isSelected) ? 1 : 0));
            _local_2.push(((getPrizeLimitCheckBox(_arg_1).isSelected) ? _SafeStr_6721.getValue() : 0));
            var _local_3:int = getDonationRateIntervalInput(_arg_1).caption;
            _local_2.push(((_local_3 >= 1) ? _local_3 : 1));
            return (_local_2);
        }

        override public function readStringParamFromForm(_arg_1:_SafeStr_3133):String
        {
            var _local_6:int;
            var _local_5:* = null;
            var _local_2:* = null;
            var _local_3:String = "";
            var _local_4:_SafeStr_3133 = _SafeStr_3133(_arg_1.findChildByName("rewards_container"));
            _local_6 = 0;
            while (_local_6 < _local_4.numChildren)
            {
                _local_5 = _SafeStr_3133(_local_4.getChildAt(_local_6));
                if (_local_5.visible)
                {
                    _local_2 = getRewardData(_local_5);
                    if (_local_2 != null)
                    {
                        _local_3 = (_local_3 + (((_local_3 == "") ? "" : ";") + _local_2));
                    };
                };
                _local_6++;
            };
            return (_local_3);
        }

        private function validateReward(_arg_1:_SafeStr_3133, _arg_2:Boolean):String
        {
            var _local_5:int;
            var _local_4:String = getRewardCodeInput(_arg_1).text;
            var _local_3:String = getPropabilityInput(_arg_1).text;
            if (((_local_4 == "") && (_local_3 == "")))
            {
                return (null);
            };
            if (_local_4.indexOf(",") > 0)
            {
                return ("Product/badge codes must not contain ',' characters.");
            };
            if (_local_4.indexOf(";") > 0)
            {
                return ("Product/badge codes must not contain ';' characters.");
            };
            var _local_6:int = 100;
            if (_local_4.length > _local_6)
            {
                return (("Product/badge codes cannot contain more than " + _local_6) + " characters.");
            };
            if (_local_4 == "")
            {
                return ("Remember to define product/badge codes for all rewards (fill all fields or leave all fields empty).");
            };
            if (!_arg_2)
            {
                if (_local_3 == "")
                {
                    return ("Remember to define probabilities for all rewards (fill all fields or leave all fields empty).");
                };
                if (isNaN(_local_3))
                {
                    return ("Make sure are probabilities are numbers.");
                };
                _local_5 = _local_3;
                if (((_local_5 < 1) || (_local_5 > 100)))
                {
                    return ("Make sure all probabilities are numbers between 1 and 100.");
                };
            };
            return (null);
        }

        private function getRewardData(_arg_1:_SafeStr_3133):String
        {
            var _local_3:String = getRewardCodeInput(_arg_1).text;
            var _local_5:String = getPropabilityInput(_arg_1).text;
            var _local_2:Boolean = getIsBadgeCheckBox(_arg_1).isSelected;
            _local_3 = replaceAll(_local_3, ";", "");
            _local_3 = replaceAll(_local_3, ",", "");
            if (_local_3 == "")
            {
                return (null);
            };
            var _local_4:int = ((isNaN(_local_5)) ? 0 : _local_5);
            return ((((((_local_2) ? "0" : "1") + ",") + _local_3) + ",") + _local_4);
        }

        private function setRewardData(_arg_1:int, _arg_2:_SafeStr_3133, _arg_3:String):void
        {
            var _local_4:Array = ((_arg_3 == null) ? [] : _arg_3.split(","));
            getRewardCodeInput(_arg_2).text = ((_local_4[1]) ? _local_4[1] : "");
            getPropabilityInput(_arg_2).text = ((_local_4[2]) ? _local_4[2] : "");
            if (((_local_4[0]) && (_local_4[0] == "0")))
            {
                getIsBadgeCheckBox(_arg_2).select();
            }
            else
            {
                getIsBadgeCheckBox(_arg_2).unselect();
            };
        }

        private function replaceAll(_arg_1:String, _arg_2:String, _arg_3:String):String
        {
            var _local_4:int = 100;
            while (_arg_1.indexOf(_arg_2) > -1)
            {
                _arg_1 = _arg_1.replace(_arg_2, _arg_3);
                if (--_local_4 < 1) break;
            };
            return (_arg_1);
        }

        override public function onInit(_arg_1:_SafeStr_3133, _arg_2:HabboUserDefinedRoomEvents):void
        {
            var _local_5:int;
            var _local_4:* = null;
            _roomEvents = _arg_2;
            _SafeStr_6721 = new SliderWindowController(_arg_2, getPrizeLimitSliderContainer(_arg_1), _arg_2.assets, 1, 1000, 1);
            _SafeStr_6721.addEventListener("change", onSliderChange);
            _SafeStr_6721.setValue(1);
            getPrizeLimitCheckBox(_arg_1).procedure = onPrizeLimitCheckBox;
            getUniquePrizeCheckBox(_arg_1).procedure = onUniquePrizeCheckBox;
            _arg_1.findChildByName("add_reward_txt").procedure = onAddReward;
            var _local_3:_SafeStr_3133 = _SafeStr_3133(_arg_1.findChildByName("rewards_container"));
            _local_5 = 0;
            while (_local_5 < 20)
            {
                _local_4 = _SafeStr_3133(_roomEvents.getXmlWindow("ude_action_inputs_17_reward"));
                _local_3.addChild(_local_4);
                _local_4.y = (_local_5 * 14);
                _local_4.id = _local_5;
                _local_5++;
            };
        }

        override public function onEditStart(_arg_1:_SafeStr_3133, _arg_2:_SafeStr_1554):void
        {
            var _local_8:int;
            var _local_6:* = null;
            var _local_3:int = _arg_2.intParams[0];
            getUserRewardIntervalSelector(_arg_1).setSelected(getIntervalRadio(_arg_1, _local_3));
            if (((_local_3 > 0) && (_arg_2.intParams.length == 4)))
            {
                getDonationRateIntervalInput(_arg_1).caption = _arg_2.intParams[3];
            }
            else
            {
                getDonationRateIntervalInput(_arg_1).caption = "1";
            };
            var _local_7:* = (_arg_2.intParams[1] == 1);
            if (_local_7)
            {
                getUniquePrizeCheckBox(_arg_1).select();
            }
            else
            {
                getUniquePrizeCheckBox(_arg_1).unselect();
            };
            var _local_4:int = _arg_2.intParams[2];
            if (_local_4 > 0)
            {
                _SafeStr_6721.setValue(_local_4);
                getPrizeLimitCheckBox(_arg_1).select();
            }
            else
            {
                getPrizeLimitCheckBox(_arg_1).unselect();
            };
            refreshPrizeLimit(_arg_1);
            var _local_9:Array = _arg_2.stringParam.split(";");
            var _local_5:_SafeStr_3133 = _SafeStr_3133(_arg_1.findChildByName("rewards_container"));
            _local_8 = 0;
            while (_local_8 < 20)
            {
                _local_6 = _SafeStr_3133(_local_5.getChildAt(_local_8));
                setRewardData(_local_8, _local_6, _local_9[_local_8]);
                if (_local_9[_local_8])
                {
                    _SafeStr_6722 = (_local_8 + 1);
                };
                _local_8++;
            };
            setEntryVisibilities(_arg_1);
            setPropabilityVisibilities(_arg_1);
        }

        override public function get hasSpecialInputs():Boolean
        {
            return (true);
        }

        private function getRewardCodeInput(_arg_1:_SafeStr_3133):ITextFieldWindow
        {
            return (ITextFieldWindow(_arg_1.findChildByName("reward_code_input")));
        }

        private function getPropabilityInput(_arg_1:_SafeStr_3133):ITextFieldWindow
        {
            return (ITextFieldWindow(_arg_1.findChildByName("propability_input")));
        }

        private function getIsBadgeCheckBox(_arg_1:_SafeStr_3133):_SafeStr_3158
        {
            return (_SafeStr_3158(_arg_1.findChildByName("is_badge_checkbox")));
        }

        private function getPrizeLimitSliderContainer(_arg_1:_SafeStr_3133):_SafeStr_3133
        {
            return (_SafeStr_3133(_arg_1.findChildByName("slider_container")));
        }

        private function getUniquePrizeCheckBox(_arg_1:_SafeStr_3133):_SafeStr_3158
        {
            return (_SafeStr_3158(_arg_1.findChildByName("unique_prize_checkbox")));
        }

        private function getPrizeLimitCheckBox(_arg_1:_SafeStr_3133):_SafeStr_3158
        {
            return (_SafeStr_3158(_arg_1.findChildByName("prize_limit_checkbox")));
        }

        private function getIntervalRadio(_arg_1:_SafeStr_3133, _arg_2:int):IRadioButtonWindow
        {
            return (IRadioButtonWindow(_arg_1.findChildByName((("interval_" + _arg_2) + "_radio"))));
        }

        private function getUserRewardIntervalSelector(_arg_1:_SafeStr_3133):ISelectorWindow
        {
            return (ISelectorWindow(_arg_1.findChildByName("user_reward_interval_selector")));
        }

        private function getDonationRateIntervalInput(_arg_1:_SafeStr_3133):ITextFieldWindow
        {
            return (ITextFieldWindow(_arg_1.findChildByName("interval_input")));
        }

        private function onSliderChange(_arg_1:Event):void
        {
            var _local_2:* = null;
            var _local_4:Number;
            var _local_3:int;
            if (_arg_1.type == "change")
            {
                _local_2 = (_arg_1.target as SliderWindowController);
                if (_local_2)
                {
                    _local_4 = _local_2.getValue();
                    _local_3 = _local_4;
                    setPrizeLimitAmount(("" + _local_3));
                };
            };
        }

        private function onPrizeLimitCheckBox(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                refreshPrizeLimit(_SafeStr_3133(_arg_2.parent));
            };
        }

        private function onUniquePrizeCheckBox(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                setPropabilityVisibilities(_SafeStr_3133(_arg_2.parent));
            };
        }

        private function onAddReward(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _SafeStr_6722++;
                setEntryVisibilities(_SafeStr_3133(_arg_2.parent.parent));
            };
        }

        private function refreshPrizeLimit(_arg_1:_SafeStr_3133):void
        {
            var _local_2:Boolean = getPrizeLimitCheckBox(_arg_1).isSelected;
            _arg_1.findChildByName("prize_limit_warning_txt").visible = (!(_local_2));
            getPrizeLimitSliderContainer(_arg_1).visible = _local_2;
            setPrizeLimitAmount(((_local_2) ? ("" + _SafeStr_6721.getValue()) : ""));
        }

        private function setPrizeLimitAmount(_arg_1:String):void
        {
            _roomEvents.localization.registerParameter("wiredfurni.params.prizelimit", "amount", _arg_1);
        }

        private function setEntryVisibilities(_arg_1:_SafeStr_3133):void
        {
            var _local_4:int;
            var _local_3:* = null;
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_arg_1.findChildByName("rewards_container"));
            _local_4 = 0;
            while (_local_4 < 20)
            {
                _local_3 = _SafeStr_3133(_local_2.getChildAt(_local_4));
                _local_3.visible = (_local_4 < _SafeStr_6722);
                _local_4++;
            };
            _local_2.height = Util.getLowestPoint(_local_2);
            _arg_1.height = Util.getLowestPoint(_arg_1);
            _roomEvents.userDefinedRoomEventsCtrl.refresh();
        }

        private function setPropabilityVisibilities(_arg_1:_SafeStr_3133):void
        {
            var _local_5:int;
            var _local_3:* = null;
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_arg_1.findChildByName("rewards_container"));
            var _local_4:Boolean = getUniquePrizeCheckBox(_arg_1).isSelected;
            _arg_1.findChildByName("propability_txt").visible = (!(_local_4));
            _local_5 = 0;
            while (_local_5 < 20)
            {
                _local_3 = _SafeStr_3133(_local_2.getChildAt(_local_5));
                getPropabilityInput(_local_3).visible = (!(_local_4));
                _local_5++;
            };
        }


    }
}//package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes

// _SafeStr_1554 = "_-W1B" (String#2019, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)
// _SafeStr_3440 = "_-T1A" (String#14449, DoABC#4)
// _SafeStr_3485 = "_-11s" (String#2865, DoABC#4)
// _SafeStr_6721 = "_-hR" (String#9332, DoABC#4)
// _SafeStr_6722 = "_-B1L" (String#10772, DoABC#4)



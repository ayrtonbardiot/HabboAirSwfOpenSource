// by nota

//com.sulake.habbo.catalog.clubcenter.ClubCenterView

package com.sulake.habbo.catalog.clubcenter
{
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.window.widgets.IRoomPreviewerWidget;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.avatar._SafeStr_3138;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window.components._SafeStr_3122;
    import _-W1K._SafeStr_1632;
    import com.sulake.habbo.catalog.purse._SafeStr_3142;
    import flash.display.BitmapData;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.utils.FriendlyTime;

    public class ClubCenterView implements _SafeStr_1875 
    {

        private var _SafeStr_4360:HabboClubCenter;
        private var _window:_SafeStr_3133;
        private var _SafeStr_4981:IRoomPreviewerWidget;
        private var _SafeStr_3819:String;

        public function ClubCenterView(_arg_1:HabboClubCenter, _arg_2:_SafeStr_1695, _arg_3:String)
        {
            _SafeStr_4360 = _arg_1;
            _window = (_arg_2.buildFromXML(XML(_SafeStr_4360.assets.getAssetByName("club_center_xml").content)) as _SafeStr_3133);
            if (!container)
            {
                return;
            };
            if (!_SafeStr_4360.isKickbackEnabled())
            {
                removeElement("special_breakdown_link");
                removeElement("special_content");
                removeElement("special_content_postit");
                container.invalidate();
            }
            else
            {
                setElementVisibility("special_amount_icon", false);
                setElementVisibility("special_amount_title", false);
                setElementVisibility("special_amount_content", false);
                setElementVisibility("special_breakdown_link", false);
                setElementVisibility("special_time_content", false);
            };
            setElementVisibility("btn_earn", false);
            _SafeStr_4360.getOffers();
            _window.center();
            _window.addEventListener("WE_RELOCATE", onRelocate);
            _SafeStr_3819 = _arg_3;
            _SafeStr_4981 = (_SafeStr_3199(_window.findChildByName("avatar")).widget as IRoomPreviewerWidget);
            var _local_4:_SafeStr_3138 = _SafeStr_4360.avatarRenderManager.createAvatarImage(_arg_3, "h", null, this);
            if (_local_4)
            {
                _local_4.setDirection("full", 4);
                _SafeStr_4981.showPreview(_local_4.getCroppedImage("full"));
            };
            container.procedure = onInput;
        }

        public function dispose():void
        {
            if (_window)
            {
                _window.removeEventListener("WE_RELOCATE", onRelocate);
                _window.dispose();
                _window = null;
            };
            _SafeStr_4360 = null;
        }

        public function dataReceived(_arg_1:_SafeStr_1632, _arg_2:_SafeStr_3142, _arg_3:int, _arg_4:BitmapData):void
        {
            var _local_7:int;
            var _local_6:* = null;
            var _local_9:String = _SafeStr_4360.resolveClubStatus();
            setElementText("status_title", (("${hccenter.status." + _local_9) + "}"));
            if (((!(_arg_1)) || (!(_arg_2))))
            {
                setElementVisibility("gift_content", false);
                setElementVisibility("special_container", false);
                return;
            };
            setElementVisibility("gift_content", true);
            var _local_5:String = getLocalization((("hccenter.status." + _local_9) + ".info"));
            _local_5 = _local_5.replace("%timeleft%", formatMinutes(_arg_2.minutesUntilExpiration));
            _local_5 = _local_5.replace("%joindate%", _arg_1.firstSubscriptionDate);
            _local_5 = _local_5.replace("%streakduration%", formatDays(_arg_1.currentHcStreak));
            setElementText("status_info", _local_5);
            var _local_8:_SafeStr_3264 = (container.findChildByName("hc_badge") as _SafeStr_3264);
            if (((_local_8) && (_arg_4)))
            {
                _local_8.bitmap = _arg_4;
            };
            if (_SafeStr_4360.isKickbackEnabled())
            {
                if (_arg_1.timeUntilPayday < 60)
                {
                    setElementText("special_time_content", getLocalization("hccenter.special.time.soon"));
                }
                else
                {
                    setElementText("special_time_content", formatMinutes(_arg_1.timeUntilPayday));
                };
                setElementVisibility("special_time_content", true);
                _local_7 = (_arg_1.creditRewardForMonthlySpent + _arg_1.creditRewardForStreakBonus);
                if (_local_7 > 0)
                {
                    setElementVisibility("special_amount_icon", true);
                    setElementVisibility("special_amount_title", true);
                    setElementVisibility("special_amount_content", true);
                    setElementVisibility("special_breakdown_link", true);
                    setElementText("special_amount_content", getLocalization("hccenter.special.sum").replace("%credits%", _local_7));
                };
            };
            _local_6 = (container.findChildByName("btn_gift") as _SafeStr_3122);
            if (((_local_9 == "active") && (_arg_3 > 0)))
            {
                if (_local_6)
                {
                    _local_6.caption = "${hccenter.btn.gifts.redeem}";
                };
                setElementText("gift_info", getLocalization("hccenter.unclaimedgifts").replace("%unclaimedgifts%", _arg_3));
            }
            else
            {
                if (_local_6)
                {
                    _local_6.caption = "${hccenter.btn.gifts.view}";
                };
                setElementText("gift_info", getLocalization("hccenter.gift.info"));
            };
            _local_6 = (container.findChildByName("btn_buy") as _SafeStr_3122);
            if (_local_9 == "active")
            {
                if (_local_6)
                {
                    _local_6.caption = "${hccenter.btn.extend}";
                };
            }
            else
            {
                if (_local_6)
                {
                    _local_6.caption = "${hccenter.btn.buy}";
                };
            };
        }

        public function avatarImageReady(_arg_1:String):void
        {
            var _local_2:* = null;
            if (_arg_1 == _SafeStr_3819)
            {
                _local_2 = _SafeStr_4360.avatarRenderManager.createAvatarImage(_SafeStr_3819, "h", null, this);
                _local_2.setDirection("full", 4);
                _SafeStr_4981.showPreview(_local_2.getCroppedImage("full"));
            };
        }

        private function onInput(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((!(_arg_1.type == "WME_DOWN")) || (!(_SafeStr_4360))))
            {
                return;
            };
            _arg_1.stopImmediatePropagation();
            _arg_1.stopPropagation();
            switch (_arg_2.name)
            {
                case "header_button_close":
                    _SafeStr_4360.removeView();
                    return;
                case "special_infolink":
                    _SafeStr_4360.openPaydayHelpPage();
                    return;
                case "special_breakdown_link":
                    _SafeStr_4360.showPaydayBreakdownView();
                    return;
                case "general_infolink":
                    _SafeStr_4360.openHelpPage();
                    return;
                case "btn_gift":
                    _SafeStr_4360.openClubGiftPage();
                    _SafeStr_4360.removeView();
                    return;
                case "btn_buy":
                    _SafeStr_4360.openPurchasePage();
                    _SafeStr_4360.removeView();
                    return;
                case "btn_earn":
                    if (_SafeStr_4360.offerCenter)
                    {
                        _SafeStr_4360.offerCenter.showVideo();
                    };
                    return;
                default:
                    return;
            };
        }

        private function onRelocate(_arg_1:_SafeStr_3116):void
        {
            _SafeStr_4360.removeBreakdown();
        }

        private function get container():_SafeStr_3133
        {
            return (_window);
        }

        private function setElementText(_arg_1:String, _arg_2:String):void
        {
            if (!container)
            {
                return;
            };
            var _local_3:ITextWindow = (container.findChildByName(_arg_1) as ITextWindow);
            if (_local_3)
            {
                _local_3.text = _arg_2;
            };
        }

        private function setElementVisibility(_arg_1:String, _arg_2:Boolean):void
        {
            if (!container)
            {
                return;
            };
            var _local_3:_SafeStr_3109 = container.findChildByName(_arg_1);
            if (_local_3)
            {
                _local_3.visible = _arg_2;
            };
        }

        public function getSpecialCalloutAnchor():_SafeStr_3109
        {
            return ((container) ? container.findChildByName("special_content_postit") : null);
        }

        private function removeElement(_arg_1:*):void
        {
            if (!container)
            {
                return;
            };
            var _local_3:_SafeStr_3109 = container.findChildByName(_arg_1);
            if (!_local_3)
            {
                return;
            };
            var _local_2:_SafeStr_3133 = (_local_3.parent as _SafeStr_3133);
            _local_2.removeChild(_local_3);
        }

        private function getLocalization(_arg_1:String):String
        {
            if (((!(_SafeStr_4360)) || (!(_SafeStr_4360.localization))))
            {
                return ("");
            };
            return (_SafeStr_4360.localization.getLocalization(_arg_1, _arg_1));
        }

        public function formatMinutes(_arg_1:int):String
        {
            return (FriendlyTime.getShortFriendlyTime(_SafeStr_4360.localization, (_arg_1 * 60)));
        }

        public function formatDays(_arg_1:int):String
        {
            return (FriendlyTime.getShortFriendlyTime(_SafeStr_4360.localization, (_arg_1 * 86400)));
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4360 == null);
        }

        public function setVideoOfferButtonVisibility(_arg_1:Boolean, _arg_2:Boolean):void
        {
            var _local_3:_SafeStr_3109 = _window.findChildByName("btn_earn");
            if (_local_3)
            {
                _local_3.visible = _arg_1;
                if (_arg_2)
                {
                    _local_3.enable();
                    _local_3.alpha = 0;
                }
                else
                {
                    _local_3.disable();
                    _local_3.alpha = 51;
                };
            };
        }


    }
}//package com.sulake.habbo.catalog.clubcenter

// _SafeStr_1632 = "_-q1C" (String#13728, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3142 = "_-z5" (String#4391, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)



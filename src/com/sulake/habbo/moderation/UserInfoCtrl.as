// by nota

//com.sulake.habbo.moderation.UserInfoCtrl

package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window.components._SafeStr_3263;
    import _-V1k._SafeStr_1616;
    import _-x1P._SafeStr_1564;
    import com.sulake.core.window._SafeStr_3133;
    import _-2s._SafeStr_349;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window._SafeStr_3109;
    import _-2s._SafeStr_733;
    import com.sulake.core.window.events._SafeStr_3116;

    public class UserInfoCtrl implements _SafeStr_13, _SafeStr_3355 
    {

        private static const secsInMinute:int = 60;
        private static const secsInHour:int = 3600;
        private static const secsInDay:int = 86400;
        private static const secsInYear:int = 31536000;

        private var _callerFrame:_SafeStr_3263;
        private var _main:ModerationManager;
        private var _SafeStr_4128:int;
        private var _SafeStr_5996:_SafeStr_1616;
        private var _SafeStr_3740:_SafeStr_1564;
        private var _SafeStr_6539:_SafeStr_3133;
        private var _openToolsBelow:Boolean;
        private var _disposed:Boolean;
        private var _SafeStr_6540:IssueHandler;

        public function UserInfoCtrl(_arg_1:_SafeStr_3263, _arg_2:ModerationManager, _arg_3:_SafeStr_1616, _arg_4:IssueHandler=null, _arg_5:Boolean=false)
        {
            _callerFrame = _arg_1;
            _main = _arg_2;
            _SafeStr_5996 = _arg_3;
            _openToolsBelow = _arg_5;
            _SafeStr_6540 = _arg_4;
        }

        public static function formatTime(_arg_1:int):String
        {
            if (_arg_1 < (2 * 60))
            {
                return (_arg_1 + " secs ago");
            };
            if (_arg_1 < (2 * 3600))
            {
                return (Math.round((_arg_1 / 60)) + " mins ago");
            };
            if (_arg_1 < (2 * 86400))
            {
                return (Math.round((_arg_1 / 3600)) + " hours ago");
            };
            if (_arg_1 < (2 * 31536000))
            {
                return (Math.round((_arg_1 / 86400)) + " days ago");
            };
            return (Math.round((_arg_1 / 31536000)) + " years ago");
        }


        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function load(_arg_1:_SafeStr_3133, _arg_2:int):void
        {
            _SafeStr_6539 = _arg_1;
            _SafeStr_4128 = _arg_2;
            _SafeStr_3740 = null;
            refresh();
            _main.messageHandler.addUserInfoListener(this);
            _main.connection.send(new _SafeStr_349(_arg_2));
        }

        public function onUserInfo(_arg_1:_SafeStr_1564):void
        {
            if (_arg_1.userId != _SafeStr_4128)
            {
                return;
            };
            _SafeStr_3740 = _arg_1;
            refresh();
        }

        public function refresh():void
        {
            if (_SafeStr_6539.disposed)
            {
                return;
            };
            var _local_1:_SafeStr_3133 = prepare();
            if (_SafeStr_3740 == null)
            {
                _local_1.findChildByName("fields").visible = false;
                _local_1.findChildByName("loading_txt").visible = true;
                return;
            };
            _local_1.findChildByName("fields").visible = true;
            _local_1.findChildByName("loading_txt").visible = false;
            setTxt(_local_1, "name_txt", _SafeStr_3740.userName);
            setTxt(_local_1, "registered_txt", formatTime((_SafeStr_3740.registrationAgeInMinutes * 60)));
            setTxt(_local_1, "cfh_count_txt", ("" + _SafeStr_3740.cfhCount));
            setAlertTxt(_local_1, "abusive_cfh_count_txt", _SafeStr_3740.abusiveCfhCount);
            setAlertTxt(_local_1, "caution_count_txt", _SafeStr_3740.cautionCount);
            setAlertTxt(_local_1, "ban_count_txt", _SafeStr_3740.banCount);
            setAlertTxt(_local_1, "trading_lock_count_txt", _SafeStr_3740.tradingLockCount);
            setTxt(_local_1, "trading_lock_expiry_txt", _SafeStr_3740.tradingExpiryDate, "No active lock");
            setTxt(_local_1, "last_login_txt", formatTime((_SafeStr_3740.minutesSinceLastLogin * 60)));
            setTxt(_local_1, "online_txt", ((_SafeStr_3740.online) ? "Yes" : "No"));
            setTxt(_local_1, "last_purchase_txt", _SafeStr_3740.lastPurchaseDate, "No purchases");
            setTxt(_local_1, "email_address_txt", _SafeStr_3740.primaryEmailAddress, "No email found");
            setTxt(_local_1, "id_bans_txt", ("" + _SafeStr_3740.identityRelatedBanCount));
            setTxt(_local_1, "user_class_txt", _SafeStr_3740.userClassification, "-");
            setTxt(_local_1, "last_sanction_time_txt", _SafeStr_3740.lastSanctionTime);
            if (_SafeStr_3740.sanctionAgeHours <= 48)
            {
                (_local_1.findChildByName("last_sanction_time_txt") as ITextWindow).textColor = (((0xFF * (48 - _SafeStr_3740.sanctionAgeHours)) / 48) << 16);
            };
            if (_SafeStr_3740.primaryEmailAddress == "No identity")
            {
                _local_1.findChildByName("modaction_but").disable();
            };
            _SafeStr_14.log(((((("USER: " + _SafeStr_3740.userName) + ", ") + _SafeStr_3740.banCount) + ", ") + _SafeStr_3740.cautionCount));
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            _main.messageHandler.removeUserInfoListener(this);
            _callerFrame = null;
            _main = null;
            _SafeStr_3740 = null;
            _SafeStr_6539 = null;
        }

        private function prepare():_SafeStr_3133
        {
            var _local_1:_SafeStr_3133 = _SafeStr_3133(_SafeStr_6539.findChildByName("user_info"));
            if (_local_1 == null)
            {
                _local_1 = _SafeStr_3133(_main.getXmlWindow("user_info"));
                _SafeStr_6539.addChild(_local_1);
                ((_main.initMsg.chatlogsPermission) ? null : _local_1.findChildByName("chatlog_but").disable());
                ((_main.initMsg.alertPermission) ? null : _local_1.findChildByName("message_but").disable());
                ((((_main.initMsg.alertPermission) || (_main.initMsg.kickPermission)) || (_main.initMsg.banPermission)) ? null : _local_1.findChildByName("modaction_but").disable());
            };
            _local_1.findChildByName("chatlog_but").procedure = onChatlogButton;
            _local_1.findChildByName("roomvisits_but").procedure = onRoomVisitsButton;
            _local_1.findChildByName("habboinfotool_but").procedure = onHabboInfoToolButton;
            _local_1.findChildByName("message_but").procedure = onMessageButton;
            _local_1.findChildByName("modaction_but").procedure = onModActionButton;
            _local_1.findChildByName("view_caution_count_txt").procedure = onViewCautions;
            _local_1.findChildByName("view_ban_count_txt").procedure = onViewBans;
            _local_1.findChildByName("view_trading_lock_count_txt").procedure = onViewTradingLocks;
            _local_1.findChildByName("view_id_bans_txt").procedure = onViewIDBans;
            return (_local_1);
        }

        private function setAlertTxt(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:int):void
        {
            var _local_5:_SafeStr_3109 = _arg_1.findChildByName(_arg_2);
            var _local_4:_SafeStr_3109 = _arg_1.findChildByName(("view_" + _arg_2));
            if (_local_4 != null)
            {
                _local_4.visible = (_arg_3 > 0);
            };
            _local_5.caption = ("" + _arg_3);
        }

        private function setTxt(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:String, _arg_4:String=""):void
        {
            var _local_5:_SafeStr_3109 = ITextWindow(_arg_1.findChildByName(_arg_2));
            if (((!(_arg_3)) || (_arg_3.length == 0)))
            {
                _local_5.caption = _arg_4;
            }
            else
            {
                _local_5.caption = _arg_3;
            };
        }

        private function onChatlogButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            trackAction("chatLog");
            _main.windowTracker.show(new ChatlogCtrl(new _SafeStr_733(_SafeStr_3740.userId), _main, 5, _SafeStr_3740.userId), _callerFrame, _openToolsBelow, false, true);
        }

        private function onRoomVisitsButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _main.windowTracker.show(new RoomVisitsCtrl(_main, _SafeStr_3740.userId), _callerFrame, _openToolsBelow, false, true);
        }

        private function onHabboInfoToolButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            trackAction("openInfoTool");
            _main.openHkPage("habboinfotool.url", _SafeStr_3740.userName);
        }

        private function onMessageButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            trackAction("openSendMessage");
            _main.windowTracker.show(new SendMsgsCtrl(_main, _SafeStr_3740.userId, _SafeStr_3740.userName, _SafeStr_5996), _callerFrame, _openToolsBelow, false, true);
        }

        private function onModActionButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            trackAction("openModAction");
            _main.windowTracker.show(new ModActionCtrl(_main, _SafeStr_3740.userId, _SafeStr_3740.userName, _SafeStr_5996, this), _callerFrame, _openToolsBelow, false, true);
        }

        private function onViewCautions(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            trackAction("viewCautions");
            showModeratorLog();
        }

        private function onViewBans(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            trackAction("viewBans");
            showModeratorLog();
        }

        private function onViewTradingLocks(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            trackAction("viewTradingLocks");
            showModeratorLog();
        }

        private function onViewIDBans(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            trackAction("viewIdentityInfo");
            showIdentityInformation();
        }

        private function showModeratorLog():void
        {
            _main.openHkPage("moderatoractionlog.url", _SafeStr_3740.userName);
        }

        private function showIdentityInformation():void
        {
            _main.openHkPage("identityinformationtool.url", ("" + _SafeStr_3740.identityId));
        }

        internal function logEvent(_arg_1:String, _arg_2:String):void
        {
            if (_main != null)
            {
                _main.logEvent(_arg_1, _arg_2);
            };
        }

        internal function trackAction(_arg_1:String):void
        {
            if (((_SafeStr_6540 == null) || (_SafeStr_6540.disposed)))
            {
                _main.trackGoogle(("userInfo_" + _arg_1));
            }
            else
            {
                if (this == _SafeStr_6540.callerUserInfo)
                {
                    _SafeStr_6540.trackAction(("callerUserInfo_" + _arg_1));
                }
                else
                {
                    if (this == _SafeStr_6540.reportedUserInfo)
                    {
                        _SafeStr_6540.trackAction(("reportedUserInfo_" + _arg_1));
                    }
                    else
                    {
                        _SafeStr_6540.trackAction(("userInfo_" + _arg_1));
                    };
                };
            };
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1564 = "_-b10" (String#28191, DoABC#4)
// _SafeStr_1616 = "_-Jg" (String#2516, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3355 = "_-C0" (String#9196, DoABC#4)
// _SafeStr_349 = "_-21k" (String#20279, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_5996 = "_-Kr" (String#2988, DoABC#4)
// _SafeStr_6539 = "_-M18" (String#8776, DoABC#4)
// _SafeStr_6540 = "_-C5" (String#7253, DoABC#4)
// _SafeStr_733 = "_-Z1S" (String#31323, DoABC#4)



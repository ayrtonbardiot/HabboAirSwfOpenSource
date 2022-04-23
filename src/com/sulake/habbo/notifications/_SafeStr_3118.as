// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.notifications._SafeStr_3118

package com.sulake.habbo.notifications
{
    import com.sulake.habbo.communication._SafeStr_25;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-x1P._SafeStr_643;
    import _-a5._SafeStr_1021;
    import _-W1K._SafeStr_752;
    import _-a5._SafeStr_648;
    import _-a5._SafeStr_900;
    import _-b1c._SafeStr_290;
    import _-AE._SafeStr_884;
    import _-EK._SafeStr_201;
    import _-EK._SafeStr_161;
    import _-W1K._SafeStr_212;
    import _-EK._SafeStr_365;
    import _-EK._SafeStr_446;
    import _-EK._SafeStr_807;
    import _-EK._SafeStr_496;
    import _-Z1z._SafeStr_303;
    import _-x1P._SafeStr_207;
    import _-EK._SafeStr_756;
    import _-Ol._SafeStr_484;
    import _-a5._SafeStr_1014;
    import _-y1x._SafeStr_1035;
    import _-81g._SafeStr_593;
    import _-EK._SafeStr_261;
    import _-x1P._SafeStr_315;
    import _-EK._SafeStr_899;
    import _-yL._SafeStr_528;
    import _-28._SafeStr_1276;
    import com.sulake.habbo.notifications.singular.MOTDNotification;
    import com.sulake.habbo.notifications.feed.data.GenericNotificationItemData;
    import flash.utils.getTimer;
    import _-28._SafeStr_1189;
    import flash.display.BitmapData;
    import _-z1k._SafeStr_1066;
    import com.sulake.core.assets.BitmapDataAsset;
    import _-V1k._SafeStr_1476;
    import _-V1k._SafeStr_1239;
    import _-V1k._SafeStr_1219;
    import _-Z1K._SafeStr_1174;
    import _-Z1K._SafeStr_1134;
    import _-Z1K._SafeStr_1168;
    import _-Z1K._SafeStr_1428;
    import com.sulake.habbo.utils.HabboWebTools;
    import _-28._SafeStr_1333;
    import com.sulake.core.localization.ILocalization;
    import _-Zz._SafeStr_1348;
    import _-28._SafeStr_1344;
    import _-28._SafeStr_1409;
    import _-PB._SafeStr_1359;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-28._SafeStr_1360;
    import _-K1r._SafeStr_1185;
    import _-NF._SafeStr_1483;
    import _-g1G._SafeStr_1439;
    import _-AE._SafeStr_1611;

    [SecureSWF(rename="true")]
    public class _SafeStr_3118 
    {

        private const CALL_FOR_HELP_NOTIFICATION_TYPE:String = "cfh.created";

        private var _notifications:HabboNotifications;
        private var _communication:_SafeStr_25;
        private var _messageEvents:Vector.<IMessageEvent>;

        public function _SafeStr_3118(_arg_1:HabboNotifications, _arg_2:_SafeStr_25)
        {
            _notifications = _arg_1;
            _communication = _arg_2;
            _messageEvents = new Vector.<IMessageEvent>(0);
            addMessageEvent(new _SafeStr_643(onModCautionEvent));
            addMessageEvent(new _SafeStr_1021(onHotelMaintenance));
            addMessageEvent(new _SafeStr_752(onRespectNotification));
            addMessageEvent(new _SafeStr_648(onHotelClosing));
            addMessageEvent(new _SafeStr_900(onHotelClosed));
            addMessageEvent(new _SafeStr_290(onPetRespectFailed));
            addMessageEvent(new _SafeStr_884(onClubGiftSelected));
            addMessageEvent(new _SafeStr_201(onLevelUp));
            addMessageEvent(new _SafeStr_161(onClubGiftNotification));
            addMessageEvent(new _SafeStr_212(onAccountSafetyLockStatusChanged));
            addMessageEvent(new _SafeStr_365(onMOTD));
            addMessageEvent(new _SafeStr_446(onActivityPointNotification));
            addMessageEvent(new _SafeStr_807(onPetLevelNotification));
            addMessageEvent(new _SafeStr_496(onNotificationDialogMessageEvent));
            addMessageEvent(new _SafeStr_303(onPetReceived));
            addMessageEvent(new _SafeStr_207(onUserBannedMessageEvent));
            addMessageEvent(new _SafeStr_756(onInfoFeedEnable));
            addMessageEvent(new _SafeStr_484(onRoomEnter));
            addMessageEvent(new _SafeStr_1014(onLoginFailedHotelClosed));
            addMessageEvent(new _SafeStr_1035(onRoomEnter));
            addMessageEvent(new _SafeStr_593(onRoomMessagesNotification));
            addMessageEvent(new _SafeStr_261(onBroadcastMessageEvent));
            addMessageEvent(new _SafeStr_315(onModMessageEvent));
            addMessageEvent(new _SafeStr_899(onRestoreClientMessageEvent));
            addMessageEvent(new _SafeStr_528(onUserObject));
            _notifications.activate();
        }

        private function addMessageEvent(_arg_1:IMessageEvent):void
        {
            _messageEvents.push(_communication.addHabboConnectionMessageEvent(_arg_1));
        }

        public function dispose():void
        {
            if (((!(_messageEvents == null)) && (!(_communication == null))))
            {
                for each (var _local_1:IMessageEvent in _messageEvents)
                {
                    _communication.removeHabboConnectionMessageEvent(_local_1);
                };
            };
            _messageEvents = null;
            _notifications = null;
            _communication = null;
        }

        private function useNotificationFeed():Boolean
        {
            return (_notifications.getBoolean("notification.feed.enabled"));
        }

        private function useNotifications():Boolean
        {
            return (_notifications.getBoolean("notification.items.enabled"));
        }

        internal function onMOTD(_arg_1:IMessageEvent):void
        {
            var _local_4:* = null;
            var _local_5:_SafeStr_365 = (_arg_1 as _SafeStr_365);
            var _local_3:_SafeStr_1276 = (_local_5.getParser() as _SafeStr_1276);
            if (((_local_3.messages) && (_local_3.messages.length > 0)))
            {
                if (useNotifications())
                {
                    new MOTDNotification(_local_3.messages, _notifications.assetLibrary, _notifications.windowManager);
                };
                if (useNotificationFeed())
                {
                    for each (var _local_2:String in _local_3.messages)
                    {
                        _local_4 = new GenericNotificationItemData();
                        _local_4.title = _local_2;
                        _local_4.timeStamp = getTimer();
                        _notifications.feedController.addFeedItem(3, _local_4);
                    };
                };
            };
        }

        private function onLevelUp(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_201 = (_arg_1 as _SafeStr_201);
            var _local_3:_SafeStr_1189 = _local_2.getParser();
            var _local_4:String = _notifications.localization.getLocalization("achievements.levelup.desc", "");
            var _local_6:String = _notifications.localization.getBadgeName(_local_3.data.badgeCode);
            var _local_5:BitmapData = _notifications.sessionDataManager.requestBadgeImage(_local_3.data.badgeCode);
            _notifications.singularController.addItem(((_local_4 + " ") + _local_6), "achievement", _local_5, null, _local_3.data.badgeCode, ("questengine/achievements/" + _local_3.data.category));
        }

        internal function onRespectNotification(_arg_1:IMessageEvent):void
        {
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_3:_SafeStr_752 = (_arg_1 as _SafeStr_752);
            if (_notifications.sessionDataManager.userId == _local_3.userId)
            {
                _notifications.localization.registerParameter("notifications.text.respect.2", "count", _local_3.respectTotal);
                _local_4 = _notifications.localization.getLocalizationRaw("notifications.text.respect.1");
                _local_2 = _notifications.localization.getLocalizationRaw("notifications.text.respect.2");
                if (_local_4)
                {
                    _notifications.singularController.addItem(_local_4.value, "respect", null);
                };
                if (_local_2)
                {
                    _notifications.singularController.addItem(_local_2.value, "respect", null);
                };
            };
        }

        private function onRoomMessagesNotification(_arg_1:_SafeStr_593):void
        {
            var _local_2:* = null;
            var _local_3:_SafeStr_1066 = _arg_1.getParser();
            var _local_5:String = "roommessagesposted";
            _notifications.localization.registerParameter("notifications.text.room.messages.posted", "room_name", _local_3.roomName);
            _notifications.localization.registerParameter("notifications.text.room.messages.posted", "messages_count", _local_3.messageCount.toString());
            _local_2 = _notifications.localization.getLocalizationRaw("notifications.text.room.messages.posted");
            var _local_6:BitmapDataAsset = (_notifications.assets.getAssetByName("if_icon_temp_png") as BitmapDataAsset);
            var _local_4:BitmapData = (_local_6.content as BitmapData);
            if (_local_2)
            {
                _notifications.singularController.addItem(_local_2.value, _local_5, _local_4.clone());
            };
        }

        private function onInfoFeedEnable(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_756 = (_arg_1 as _SafeStr_756);
            if (_local_2 != null)
            {
                _notifications.disabled = (!(_local_2.enabled));
            };
        }

        private function onModCautionEvent(_arg_1:IMessageEvent):void
        {
            var _local_3:* = null;
            var _local_2:_SafeStr_1476 = (_arg_1 as _SafeStr_643).getParser();
            if (((_local_2 == null) || (_notifications.singularController.alertDialogManager == null)))
            {
                return;
            };
            if (useNotifications())
            {
                _notifications.singularController.alertDialogManager.handleModeratorCaution(_local_2.message, _local_2.url);
            };
            if (useNotificationFeed())
            {
                _local_3 = new GenericNotificationItemData();
                _local_3.title = _local_2.message;
                _local_3.buttonAction = _local_2.url;
                _local_3.buttonCaption = _local_2.url;
                _local_3.timeStamp = getTimer();
                _notifications.feedController.addFeedItem(3, _local_3);
            };
        }

        private function onModMessageEvent(_arg_1:IMessageEvent):void
        {
            var _local_3:* = null;
            var _local_2:_SafeStr_1239 = (_arg_1 as _SafeStr_315).getParser();
            if (((_local_2 == null) || (_notifications.singularController.alertDialogManager == null)))
            {
                return;
            };
            if (useNotifications())
            {
                _notifications.singularController.alertDialogManager.handleModeratorMessage(_local_2.message, _local_2.url);
            };
            if (useNotificationFeed())
            {
                _local_3 = new GenericNotificationItemData();
                _local_3.title = _local_2.message;
                _local_3.buttonAction = _local_2.url;
                _local_3.buttonCaption = _local_2.url;
                _local_3.timeStamp = getTimer();
                _notifications.feedController.addFeedItem(3, _local_3);
            };
        }

        private function onUserBannedMessageEvent(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1219 = (_arg_1 as _SafeStr_207).getParser();
            if (((_local_2 == null) || (_notifications.singularController.alertDialogManager == null)))
            {
                return;
            };
            _notifications.singularController.alertDialogManager.handleUserBannedMessage(_local_2.message);
        }

        private function onHotelClosing(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1174 = (_arg_1 as _SafeStr_648).getParser();
            if (((_local_2 == null) || (_notifications.singularController.alertDialogManager == null)))
            {
                return;
            };
            _notifications.singularController.alertDialogManager.handleHotelClosingMessage(_local_2.minutesUntilClosing);
        }

        private function onHotelMaintenance(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1134 = (_arg_1 as _SafeStr_1021).getParser();
            if (((_local_2 == null) || (_notifications.singularController.alertDialogManager == null)))
            {
                return;
            };
            _notifications.singularController.alertDialogManager.handleHotelMaintenanceMessage(_local_2.minutesUntilMaintenance, _local_2.duration);
        }

        private function onHotelClosed(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1168 = (_arg_1 as _SafeStr_900).getParser();
            if (((_local_2 == null) || (_notifications.singularController.alertDialogManager == null)))
            {
                return;
            };
            _notifications.singularController.alertDialogManager.handleHotelClosedMessage(_local_2.openHour, _local_2.openMinute, _local_2.userThrownOutAtClose);
        }

        private function onLoginFailedHotelClosed(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1428 = (_arg_1 as _SafeStr_1014).getParser();
            if (((_local_2 == null) || (_notifications.singularController.alertDialogManager == null)))
            {
                return;
            };
            _notifications.singularController.alertDialogManager.handleLoginFailedHotelClosedMessage(_local_2.openHour, _local_2.openMinute);
        }

        private function onRestoreClientMessageEvent(_arg_1:IMessageEvent):void
        {
            HabboWebTools.closeWebPageAndRestoreClient();
        }

        private function onPetLevelNotification(_arg_1:_SafeStr_807):void
        {
            var _local_2:* = null;
            var _local_5:* = null;
            if (_arg_1 == null)
            {
                return;
            };
            var _local_4:_SafeStr_1333 = _arg_1.getParser();
            _notifications.localization.registerParameter("notifications.text.petlevel", "pet_name", _local_4.petName);
            _notifications.localization.registerParameter("notifications.text.petlevel", "level", _local_4.level.toString());
            var _local_3:ILocalization = _notifications.localization.getLocalizationRaw("notifications.text.petlevel");
            if (_local_3)
            {
                _local_2 = _local_4.figureData;
                _local_5 = _notifications.petImageUtility.getPetImage(_local_2.typeId, _local_2.paletteId, _local_2.color);
                _notifications.singularController.addItem(_local_3.value, "petlevel", _local_5);
            };
        }

        private function onPetReceived(_arg_1:_SafeStr_303):void
        {
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_5:* = null;
            if (_arg_1 == null)
            {
                return;
            };
            var _local_3:_SafeStr_1348 = _arg_1.getParser();
            if (_local_3.boughtAsGift)
            {
                _local_2 = _notifications.localization.getLocalizationRaw("notifications.text.petbought");
            }
            else
            {
                _local_2 = _notifications.localization.getLocalizationRaw("notifications.text.petreceived");
            };
            if (_local_2)
            {
                _local_4 = _local_3.pet;
                _local_5 = _notifications.petImageUtility.getPetImage(_local_4.typeId, _local_4.paletteId, _local_4.color);
                _notifications.singularController.addItem(_local_2.value, "petlevel", _local_5);
            };
        }

        private function onRoomEnter(_arg_1:IMessageEvent):void
        {
            _notifications.singularController.showModerationDisclaimer();
        }

        private function onBroadcastMessageEvent(_arg_1:IMessageEvent):void
        {
            var _local_4:_SafeStr_1344 = (_arg_1 as _SafeStr_261).getParser();
            var _local_2:String = _local_4.messageText;
            var _local_3:RegExp = /\\r/g;
            _local_2 = _local_2.replace(_local_3, "\r");
            _notifications.windowManager.simpleAlert("${notifications.broadcast.title}", "", _local_2, "", "", null, "illumina_alert_illustrations_frank_neutral_png");
        }

        private function onNotificationDialogMessageEvent(_arg_1:_SafeStr_496):void
        {
            var _local_2:_SafeStr_1409 = _arg_1.getParser();
            if ("cfh.created" == _local_2.type)
            {
                showCallCreatedNotification(_local_2.parameters["message"], _local_2.parameters["linkUrl"]);
            }
            else
            {
                _notifications.showNotification(_local_2.type, _local_2.parameters);
            };
        }

        private function showCallCreatedNotification(_arg_1:String, _arg_2:String):void
        {
            var _local_3:String = _arg_1.replace(/\\r/g, "\r");
            if (_arg_2 != null)
            {
                _notifications.windowManager.simpleAlert("${help.cfh.sent.title}", "", _local_3, "${help.main.faq.link.text}", _arg_2, null, "illumina_alert_illustrations_frank_neutral_png");
            }
            else
            {
                _notifications.windowManager.simpleAlert("${help.cfh.sent.title}", "", _local_3, null, null, null, "illumina_alert_illustrations_frank_neutral_png");
            };
        }

        private function onPetRespectFailed(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1359 = (_arg_1 as _SafeStr_290).getParser();
            this._notifications.localization.registerParameter("room.error.pets.respectfailed", "required_age", ("" + _local_2.requiredDays));
            this._notifications.localization.registerParameter("room.error.pets.respectfailed", "avatar_age", ("" + _local_2.avatarAgeInDays));
            _notifications.windowManager.alert("${error.title}", "${room.error.pets.respectfailed}", 0, onAlert);
        }

        public function onAlert(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            if (((_arg_2.type == "WE_OK") || (_arg_2.type == "WE_CANCEL")))
            {
                _arg_1.dispose();
            };
        }

        private function onClubGiftNotification(_arg_1:_SafeStr_161):void
        {
            if (!_arg_1)
            {
                return;
            };
            var _local_2:_SafeStr_1360 = _arg_1.getParser();
            if (!_local_2)
            {
                return;
            };
            if (_local_2.numGifts < 1)
            {
                return;
            };
            _notifications.singularController.showClubGiftNotification(_local_2.numGifts);
        }

        private function onUserObject(_arg_1:_SafeStr_528):void
        {
            var _local_2:_SafeStr_1185 = _arg_1.getParser();
            if (_local_2.accountSafetyLocked)
            {
                _notifications.singularController.showSafetyLockedNotification(_local_2.id);
            };
        }

        private function onAccountSafetyLockStatusChanged(_arg_1:_SafeStr_212):void
        {
            var _local_2:_SafeStr_1483 = _arg_1.getParser();
            if (_local_2.status == 1)
            {
                _notifications.singularController.hideSafetyLockedNotification();
            };
        }

        private function onClubGiftSelected(_arg_1:_SafeStr_884):void
        {
            if (((!(_arg_1)) || (!(_notifications.localization))))
            {
                return;
            };
            var _local_3:_SafeStr_1439 = _arg_1.getParser();
            if (!_local_3)
            {
                return;
            };
            var _local_6:Array = _local_3.products;
            if (((!(_local_6)) || (_local_6.length == 0)))
            {
                return;
            };
            var _local_2:_SafeStr_1611 = (_local_6[0] as _SafeStr_1611);
            if (!_local_2)
            {
                return;
            };
            var _local_5:String = _notifications.localization.getLocalization("notifications.text.club_gift.received");
            var _local_4:BitmapData = _notifications.productImageUtility.getProductImage(_local_2.productType, _local_2.furniClassId, _local_2.extraParam);
            _notifications.singularController.addItem(_local_5, "info", _local_4);
        }

        private function onActivityPointNotification(_arg_1:_SafeStr_446):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            if (_arg_1.change <= 0)
            {
                return;
            };
            switch (_arg_1.type)
            {
                case 5:
                    _local_3 = _notifications.localization.getLocalizationWithParams("notifications.text.loyalty.received", "", "amount", _arg_1.change);
                    _local_2 = (_notifications.assets.getAssetByName("if_icon_diamond_png").content as BitmapData);
                    break;
                default:
                    return;
            };
            _notifications.singularController.addItem(_local_3, "info", _local_2.clone());
        }


    }
}//package com.sulake.habbo.notifications

// _SafeStr_1014 = "_-X8" (String#11765, DoABC#4)
// _SafeStr_1021 = "_-T10" (String#9490, DoABC#4)
// _SafeStr_1035 = "_-9B" (String#10355, DoABC#4)
// _SafeStr_1066 = "_-W1A" (String#36646, DoABC#4)
// _SafeStr_1134 = "_-j11" (String#23169, DoABC#4)
// _SafeStr_1168 = "_-21Y" (String#34264, DoABC#4)
// _SafeStr_1174 = "_-61I" (String#33750, DoABC#4)
// _SafeStr_1185 = "_-Fb" (String#8393, DoABC#4)
// _SafeStr_1189 = "_-9l" (String#22603, DoABC#4)
// _SafeStr_1219 = "_-y1C" (String#33343, DoABC#4)
// _SafeStr_1239 = "_-N9" (String#39322, DoABC#4)
// _SafeStr_1276 = "_-W2" (String#28486, DoABC#4)
// _SafeStr_1333 = "_-W1R" (String#36682, DoABC#4)
// _SafeStr_1344 = "_-P1" (String#39241, DoABC#4)
// _SafeStr_1348 = "_-02G" (String#35054, DoABC#4)
// _SafeStr_1359 = "_-gP" (String#31811, DoABC#4)
// _SafeStr_1360 = "_-H1A" (String#39682, DoABC#4)
// _SafeStr_1409 = "_-pg" (String#32280, DoABC#4)
// _SafeStr_1428 = "_-01D" (String#29672, DoABC#4)
// _SafeStr_1439 = "_-01w" (String#35288, DoABC#4)
// _SafeStr_1476 = "_-1J" (String#39011, DoABC#4)
// _SafeStr_1483 = "_-OO" (String#30822, DoABC#4)
// _SafeStr_1552 = "_-JF" (String#13053, DoABC#4)
// _SafeStr_1573 = "_-iW" (String#6355, DoABC#4)
// _SafeStr_161 = "_-h1R" (String#23006, DoABC#4)
// _SafeStr_1611 = "_-m6" (String#8890, DoABC#4)
// _SafeStr_201 = "_-w1t" (String#4981, DoABC#4)
// _SafeStr_207 = "_-l13" (String#23072, DoABC#4)
// _SafeStr_212 = "_-91E" (String#11861, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_261 = "_-q1S" (String#24620, DoABC#4)
// _SafeStr_290 = "_-s1h" (String#11746, DoABC#4)
// _SafeStr_303 = "_-211" (String#24211, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3118 = "_-wi" (String#2138, DoABC#4)
// _SafeStr_315 = "_-BI" (String#23221, DoABC#4)
// _SafeStr_365 = "_-S1P" (String#22049, DoABC#4)
// _SafeStr_446 = "_-32Q" (String#7689, DoABC#4)
// _SafeStr_484 = "_-4N" (String#2464, DoABC#4)
// _SafeStr_496 = "_-v1s" (String#24290, DoABC#4)
// _SafeStr_528 = "_-MO" (String#2024, DoABC#4)
// _SafeStr_593 = "_-X1b" (String#25249, DoABC#4)
// _SafeStr_643 = "_-619" (String#23642, DoABC#4)
// _SafeStr_648 = "_-a1e" (String#15387, DoABC#4)
// _SafeStr_752 = "_-X1q" (String#9381, DoABC#4)
// _SafeStr_756 = "_-s1t" (String#18562, DoABC#4)
// _SafeStr_807 = "_-Ck" (String#22987, DoABC#4)
// _SafeStr_884 = "_-P4" (String#23046, DoABC#4)
// _SafeStr_899 = "_-Up" (String#28492, DoABC#4)
// _SafeStr_900 = "_-3C" (String#14847, DoABC#4)



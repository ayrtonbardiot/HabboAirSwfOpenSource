// by nota

//com.sulake.habbo.ui.widget.infostand.InfoStandWidget

package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.window._SafeStr_3133;
    import flash.utils.Timer;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.ui.handler.InfoStandWidgetHandler;
    import com.sulake.core.window._SafeStr_3109;
    import flash.geom.Rectangle;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.utils._SafeStr_24;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
    import flash.events.TimerEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotInfoUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfoUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetInfoUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetFigureUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPetCommandsUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetSongUpdateEvent;

    public class InfoStandWidget extends RoomWidgetBase 
    {

        private const USER_VIEW:String = "infostand_user_view";
        private const _SafeStr_9037:String = "infostand_furni_view";
        private const PET_VIEW:String = "infostand_pet_view";
        private const BOT_VIEW:String = "infostand_bot_view";
        private const RENTABLE_BOT_VIEW:String = "infostand_rentable_bot_view";
        private const _SafeStr_9038:String = "infostand_jukebox_view";
        private const CRACKABLE_FURNI_VIEW:String = "infostand_crackable_furni_view";
        private const SONGDISK_VIEW:String = "infostand_songdisk_view";
        private const UPDATE_INTERVAL_MS:int = 3000;

        private var _SafeStr_5306:InfoStandFurniView;
        private var _SafeStr_5307:InfoStandUserView;
        private var _SafeStr_5311:InfoStandPetView;
        private var _SafeStr_5309:InfoStandBotView;
        private var _SafeStr_5310:InfoStandRentableBotView;
        private var _SafeStr_5312:InfoStandJukeboxView;
        private var _SafeStr_5313:InfoStandCrackableFurniView;
        private var _SafeStr_5314:InfoStandSongDiskView;
        private var _SafeStr_9039:Array;
        private var _SafeStr_5308:InfoStandUserData;
        private var _SafeStr_4362:InfoStandFurniData;
        private var _SafeStr_5316:InfoStandPetData;
        private var _SafeStr_5315:InfoStandRentableBotData;
        private var _SafeStr_3855:_SafeStr_3133;
        private var _SafeStr_5305:Timer;
        private var _config:_SafeStr_19;

        public function InfoStandWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:_SafeStr_18, _arg_5:_SafeStr_19, _arg_6:IHabboCatalog)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            _config = _arg_5;
            _SafeStr_5306 = new InfoStandFurniView(this, "infostand_furni_view", _arg_6);
            _SafeStr_5307 = new InfoStandUserView(this, "infostand_user_view");
            _SafeStr_5311 = new InfoStandPetView(this, "infostand_pet_view", _arg_6);
            _SafeStr_5309 = new InfoStandBotView(this, "infostand_bot_view");
            _SafeStr_5310 = new InfoStandRentableBotView(this, "infostand_rentable_bot_view", _arg_6);
            _SafeStr_5312 = new InfoStandJukeboxView(this, "infostand_jukebox_view", _arg_6);
            _SafeStr_5313 = new InfoStandCrackableFurniView(this, "infostand_crackable_furni_view", _arg_6);
            _SafeStr_5314 = new InfoStandSongDiskView(this, "infostand_songdisk_view", _arg_6);
            _SafeStr_5308 = new InfoStandUserData();
            _SafeStr_4362 = new InfoStandFurniData();
            _SafeStr_5316 = new InfoStandPetData();
            _SafeStr_5315 = new InfoStandRentableBotData();
            _SafeStr_5305 = new Timer(3000);
            _SafeStr_5305.addEventListener("timer", onUpdateTimer);
            mainContainer.visible = false;
            this.handler.widget = this;
        }

        public function get handler():InfoStandWidgetHandler
        {
            return (_SafeStr_3914 as InfoStandWidgetHandler);
        }

        public function get furniView():InfoStandFurniView
        {
            return (_SafeStr_5306);
        }

        override public function get mainWindow():_SafeStr_3109
        {
            return (mainContainer);
        }

        public function get config():_SafeStr_19
        {
            return (_config);
        }

        public function get mainContainer():_SafeStr_3133
        {
            if (_SafeStr_3855 == null)
            {
                _SafeStr_3855 = (windowManager.createWindow("infostand_main_container", "", 4, 0, 0, new Rectangle(0, 0, 50, 100)) as _SafeStr_3133);
                _SafeStr_3855.tags.push("room_widget_infostand");
                _SafeStr_3855.background = true;
                _SafeStr_3855.color = 0;
            };
            return (_SafeStr_3855);
        }

        public function favouriteGroupUpdated(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String):void
        {
            var _local_6:* = null;
            if (((!(userData)) || (!(userData.userRoomId == _arg_1))))
            {
                return;
            };
            if (!mainContainer)
            {
                return;
            };
            var _local_5:_SafeStr_3109 = mainContainer.findChildByName("infostand_user_view");
            if (((!(_local_5)) || (!(_local_5.visible))))
            {
                return;
            };
            _SafeStr_5307.clearGroupBadge();
            if (_arg_2 != -1)
            {
                _local_6 = handler.container.sessionDataManager.getGroupBadgeId(_arg_2);
                userData.groupId = _arg_2;
                userData.groupBadgeId = _local_6;
                userData.groupName = _arg_4;
                _SafeStr_5307.setGroupBadge(_local_6);
            };
        }

        public function getXmlWindow(_arg_1:String):_SafeStr_3109
        {
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_3:_SafeStr_3109;
            try
            {
                _local_4 = assets.getAssetByName(_arg_1);
                _local_2 = XmlAsset(_local_4);
                _local_3 = windowManager.buildFromXML(XML(_local_2.content));
            }
            catch(e:Error)
            {
                _SafeStr_14.log(("[InfoStandWidget] Missing window XML: " + _arg_1));
            };
            return (_local_3);
        }

        public function setRelationshipStatus(_arg_1:int, _arg_2:_SafeStr_24):void
        {
            if (_SafeStr_5308.userId == _arg_1)
            {
                _SafeStr_5307.setRelationshipStatuses(_arg_2);
            };
        }

        override public function dispose():void
        {
            if (_SafeStr_5305)
            {
                _SafeStr_5305.stop();
            };
            _SafeStr_5305 = null;
            if (_SafeStr_5307)
            {
                _SafeStr_5307.dispose();
            };
            _SafeStr_5307 = null;
            if (_SafeStr_5306)
            {
                _SafeStr_5306.dispose();
            };
            _SafeStr_5306 = null;
            if (_SafeStr_5309)
            {
                _SafeStr_5309.dispose();
            };
            _SafeStr_5309 = null;
            if (_SafeStr_5310)
            {
                _SafeStr_5310.dispose();
            };
            _SafeStr_5310 = null;
            if (_SafeStr_5311)
            {
                _SafeStr_5311.dispose();
            };
            _SafeStr_5311 = null;
            if (_SafeStr_5312)
            {
                _SafeStr_5312.dispose();
            };
            _SafeStr_5312 = null;
            if (_SafeStr_5313)
            {
                _SafeStr_5313.dispose();
            };
            _SafeStr_5313 = null;
            if (_SafeStr_5314)
            {
                _SafeStr_5314.dispose();
            };
            _SafeStr_5314 = null;
            super.dispose();
        }

        override public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addEventListener("RWROUE_OBJECT_SELECTED", onRoomObjectSelected);
            _arg_1.addEventListener("RWROUE_OBJECT_DESELECTED", onClose);
            _arg_1.addEventListener("RWROUE_USER_REMOVED", onRoomObjectRemoved);
            _arg_1.addEventListener("RWROUE_FURNI_REMOVED", onRoomObjectRemoved);
            _arg_1.addEventListener("RWUIUE_OWN_USER", onUserInfo);
            _arg_1.addEventListener("RWUIUE_PEER", onUserInfo);
            _arg_1.addEventListener("RWUIUE_BOT", onBotInfo);
            _arg_1.addEventListener("RWFIUE_FURNI", onFurniInfo);
            _arg_1.addEventListener("RWRBIUE_RENTABLE_BOT", onRentableBotInfo);
            _arg_1.addEventListener("RWPIUE_PET_INFO", onPetInfo);
            _arg_1.addEventListener("RWPCUE_PET_COMMANDS", onPetCommands);
            _arg_1.addEventListener("RWPCUE_OPEN_PET_TRAINING", onOpenPetTraining);
            _arg_1.addEventListener("RWPCUE_CLOSE_PET_TRAINING", onClosePetTraining);
            _arg_1.addEventListener("RWSUE_PLAYING_CHANGED", onSongUpdate);
            _arg_1.addEventListener("RWSUE_DATA_RECEIVED", onSongUpdate);
            _arg_1.addEventListener("RWPIUE_PET_FIGURE_UPDATE", onPetFigureUpdate);
            super.registerUpdateEvents(_arg_1);
        }

        override public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.removeEventListener("RWROUE_OBJECT_SELECTED", onRoomObjectSelected);
            _arg_1.removeEventListener("RWROUE_OBJECT_DESELECTED", onClose);
            _arg_1.removeEventListener("RWROUE_USER_REMOVED", onRoomObjectRemoved);
            _arg_1.removeEventListener("RWROUE_FURNI_REMOVED", onRoomObjectRemoved);
            _arg_1.removeEventListener("RWUIUE_OWN_USER", onUserInfo);
            _arg_1.removeEventListener("RWUIUE_PEER", onUserInfo);
            _arg_1.removeEventListener("RWUIUE_BOT", onBotInfo);
            _arg_1.removeEventListener("RWFIUE_FURNI", onFurniInfo);
            _arg_1.removeEventListener("RWPIUE_PET_INFO", onPetInfo);
            _arg_1.removeEventListener("RWPCUE_PET_COMMANDS", onPetCommands);
            _arg_1.removeEventListener("RWPCUE_OPEN_PET_TRAINING", onOpenPetTraining);
            _arg_1.removeEventListener("RWPCUE_CLOSE_PET_TRAINING", onClosePetTraining);
            _arg_1.removeEventListener("RWSUE_PLAYING_CHANGED", onSongUpdate);
            _arg_1.removeEventListener("RWSUE_DATA_RECEIVED", onSongUpdate);
            _arg_1.removeEventListener("RWPIUE_PET_FIGURE_UPDATE", onPetFigureUpdate);
        }

        public function get rentableBotData():InfoStandRentableBotData
        {
            return (_SafeStr_5315);
        }

        public function get userData():InfoStandUserData
        {
            return (_SafeStr_5308);
        }

        public function get furniData():InfoStandFurniData
        {
            return (_SafeStr_4362);
        }

        public function get petData():InfoStandPetData
        {
            return (_SafeStr_5316);
        }

        private function onUpdateTimer(_arg_1:TimerEvent):void
        {
            if (_SafeStr_5311 == null)
            {
                return;
            };
            messageListener.processWidgetMessage(new RoomWidgetUserActionMessage("RWUAM_REQUEST_PET_UPDATE", _SafeStr_5311.getCurrentPetId()));
        }

        private function onUserInfo(_arg_1:RoomWidgetUserInfoUpdateEvent):void
        {
            userData.setData(_arg_1);
            _SafeStr_5307.update(_arg_1);
            selectView("infostand_user_view");
            if (_SafeStr_5305)
            {
                _SafeStr_5305.stop();
            };
        }

        private function onBotInfo(_arg_1:RoomWidgetUserInfoUpdateEvent):void
        {
            userData.setData(_arg_1);
            _SafeStr_5309.update(_arg_1);
            selectView("infostand_bot_view");
            if (_SafeStr_5305)
            {
                _SafeStr_5305.stop();
            };
        }

        private function onRentableBotInfo(_arg_1:RoomWidgetRentableBotInfoUpdateEvent):void
        {
            rentableBotData.setData(_arg_1);
            _SafeStr_5310.update(_arg_1);
            selectView("infostand_rentable_bot_view");
            if (_SafeStr_5305)
            {
                _SafeStr_5305.stop();
            };
        }

        private function onFurniInfo(_arg_1:RoomWidgetFurniInfoUpdateEvent):void
        {
            furniData.setData(_arg_1);
            if (_arg_1.extraParam == "RWEIEP_JUKEBOX")
            {
                _SafeStr_5312.update(_arg_1);
                selectView("infostand_jukebox_view");
            }
            else
            {
                if (_arg_1.extraParam.indexOf("RWEIEP_SONGDISK") != -1)
                {
                    _SafeStr_5314.update(_arg_1);
                    selectView("infostand_songdisk_view");
                }
                else
                {
                    if (_arg_1.extraParam.indexOf("RWEIEP_CRACKABLE_FURNI") != -1)
                    {
                        _SafeStr_5313.update(_arg_1);
                        selectView("infostand_crackable_furni_view");
                    }
                    else
                    {
                        _SafeStr_5306.update(_arg_1);
                        selectView("infostand_furni_view");
                    };
                };
            };
            if (_SafeStr_5305)
            {
                _SafeStr_5305.stop();
            };
        }

        private function onPetInfo(_arg_1:RoomWidgetPetInfoUpdateEvent):void
        {
            petData.setData(_arg_1);
            userData.petRespectLeft = _arg_1.petRespectLeft;
            _SafeStr_5311.update(petData);
            selectView("infostand_pet_view");
            if (_SafeStr_5305)
            {
                _SafeStr_5305.start();
            };
        }

        private function onPetFigureUpdate(_arg_1:RoomWidgetPetFigureUpdateEvent):void
        {
            _SafeStr_5311.updateImage(_arg_1.petId, _arg_1.image);
        }

        private function onPetCommands(_arg_1:RoomWidgetPetCommandsUpdateEvent):void
        {
            var _local_2:Array = _arg_1.allCommands;
            var _local_3:Array = _arg_1.enabledCommands;
            if (((((petData.type == 0) && (!(_config.getBoolean("nest.breeding.dog.enabled")))) || ((petData.type == 1) && (!(_config.getBoolean("nest.breeding.cat.enabled"))))) || ((petData.type == 5) && (!(_config.getBoolean("nest.breeding.pig.enabled"))))))
            {
                if (_local_2.indexOf(46) != -1)
                {
                    _local_2.splice(_local_2.indexOf(46), 1);
                };
                if (_local_3.indexOf(46) != -1)
                {
                    _local_3.splice(_local_3.indexOf(46), 1);
                };
            };
            _SafeStr_5311.updateEnabledTrainingCommands(_arg_1.id, new CommandConfiguration(_arg_1.allCommands, _arg_1.enabledCommands));
        }

        private function onOpenPetTraining(_arg_1:RoomWidgetUpdateEvent):void
        {
            _SafeStr_5311.openTrainView();
        }

        private function onClosePetTraining(_arg_1:RoomWidgetUpdateEvent):void
        {
            _SafeStr_5311.closeTrainView();
        }

        public function updateUserData(_arg_1:int, _arg_2:String, _arg_3:int, _arg_4:String, _arg_5:Boolean):void
        {
            if (_arg_1 != userData.userId)
            {
                return;
            };
            if (userData.isBot())
            {
                _SafeStr_5309.setFigure(_arg_2);
            }
            else
            {
                _SafeStr_5307.setFigure(_arg_2);
                _SafeStr_5307.setMotto(_arg_4, _arg_5);
                if (handler.isActivityDisplayEnabled)
                {
                    _SafeStr_5307.achievementScore = _arg_3;
                };
            };
        }

        public function refreshBadges(_arg_1:int, _arg_2:Array):void
        {
            if (_arg_1 != userData.userId)
            {
                return;
            };
            userData.badges = _arg_2;
            if (userData.isBot())
            {
                _SafeStr_5309.clearBadges();
            }
            else
            {
                _SafeStr_5307.clearBadges();
            };
            for each (var _local_3:String in _arg_2)
            {
                refreshBadge(_local_3);
            };
        }

        public function refreshBadge(_arg_1:String):void
        {
            var _local_2:int = userData.badges.indexOf(_arg_1);
            if (_local_2 >= 0)
            {
                if (userData.isBot())
                {
                    _SafeStr_5309.setBadge(_local_2, _arg_1);
                }
                else
                {
                    _SafeStr_5307.setBadge(_local_2, _arg_1);
                };
                return;
            };
            if (_arg_1 == userData.groupBadgeId)
            {
                _SafeStr_5307.setGroupBadge(_arg_1);
            };
        }

        private function onRoomObjectSelected(_arg_1:RoomWidgetRoomObjectUpdateEvent):void
        {
            var _local_2:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage("RWROM_GET_OBJECT_INFO", _arg_1.id, _arg_1.category);
            messageListener.processWidgetMessage(_local_2);
        }

        private function onRoomObjectRemoved(_arg_1:RoomWidgetRoomObjectUpdateEvent):void
        {
            var _local_2:Boolean;
            switch (_arg_1.type)
            {
                case "RWROUE_FURNI_REMOVED":
                    _local_2 = (_arg_1.id == _SafeStr_4362.id);
                    break;
                case "RWROUE_USER_REMOVED":
                    if ((((!(_SafeStr_5307 == null)) && (!(_SafeStr_5307.window == null))) && (_SafeStr_5307.window.visible)))
                    {
                        _local_2 = (_arg_1.id == _SafeStr_5308.userRoomId);
                        break;
                    };
                    if ((((!(_SafeStr_5311 == null)) && (!(_SafeStr_5311.window == null))) && (_SafeStr_5311.window.visible)))
                    {
                        _local_2 = (_arg_1.id == _SafeStr_5316.roomIndex);
                        break;
                    };
                    if ((((!(_SafeStr_5309 == null)) && (!(_SafeStr_5309.window == null))) && (_SafeStr_5309.window.visible)))
                    {
                        _local_2 = (_arg_1.id == _SafeStr_5308.userRoomId);
                        break;
                    };
                    if ((((!(_SafeStr_5310 == null)) && (!(_SafeStr_5310.window == null))) && (_SafeStr_5310.window.visible)))
                    {
                        _local_2 = (_arg_1.id == _SafeStr_5315.userRoomId);
                        break;
                    };
            };
            if (_local_2)
            {
                close();
            };
        }

        private function onSongUpdate(_arg_1:RoomWidgetSongUpdateEvent):void
        {
            _SafeStr_5312.updateSongInfo(_arg_1);
            _SafeStr_5314.updateSongInfo(_arg_1);
        }

        public function close():void
        {
            hideChildren();
            if (_SafeStr_5305)
            {
                _SafeStr_5305.stop();
            };
        }

        private function onClose(_arg_1:RoomWidgetRoomObjectUpdateEvent):void
        {
            close();
            if (_SafeStr_5305)
            {
                _SafeStr_5305.stop();
            };
        }

        private function hideChildren():void
        {
            var _local_1:int;
            if (_SafeStr_3855 != null)
            {
                _local_1 = 0;
                while (_local_1 < _SafeStr_3855.numChildren)
                {
                    _SafeStr_3855.getChildAt(_local_1).visible = false;
                    _local_1++;
                };
            };
        }

        public function isFurniViewVisible():Boolean
        {
            var _local_1:* = null;
            if (_SafeStr_3855 != null)
            {
                _local_1 = (_SafeStr_3855.getChildByName("infostand_furni_view") as _SafeStr_3109);
                if (_local_1 != null)
                {
                    return (_local_1.visible);
                };
            };
            return (false);
        }

        private function selectView(_arg_1:String):void
        {
            hideChildren();
            var _local_2:_SafeStr_3109 = (mainContainer.getChildByName(_arg_1) as _SafeStr_3109);
            if (_local_2 == null)
            {
                return;
            };
            _local_2.visible = true;
            mainContainer.visible = true;
            mainContainer.width = _local_2.width;
            mainContainer.height = _local_2.height;
        }

        public function refreshContainer():void
        {
            var _local_2:* = null;
            var _local_1:int;
            _local_1 = 0;
            while (_local_1 < mainContainer.numChildren)
            {
                _local_2 = mainContainer.getChildAt(_local_1);
                if (_local_2.visible)
                {
                    mainContainer.width = _local_2.width;
                    mainContainer.height = _local_2.height;
                };
                _local_1++;
            };
        }


    }
}//package com.sulake.habbo.ui.widget.infostand

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3855 = "_-n0" (String#1385, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_4362 = "_-vN" (String#1324, DoABC#4)
// _SafeStr_5305 = "_-U1e" (String#2071, DoABC#4)
// _SafeStr_5306 = "_-H1S" (String#8406, DoABC#4)
// _SafeStr_5307 = "_-V1O" (String#3757, DoABC#4)
// _SafeStr_5308 = "_-je" (String#10595, DoABC#4)
// _SafeStr_5309 = "_-mm" (String#5281, DoABC#4)
// _SafeStr_5310 = "_-Xd" (String#6932, DoABC#4)
// _SafeStr_5311 = "_-C1b" (String#4396, DoABC#4)
// _SafeStr_5312 = "_-I10" (String#7924, DoABC#4)
// _SafeStr_5313 = "_-k14" (String#9720, DoABC#4)
// _SafeStr_5314 = "_-12V" (String#7877, DoABC#4)
// _SafeStr_5315 = "_-7q" (String#15711, DoABC#4)
// _SafeStr_5316 = "_-k1l" (String#1416, DoABC#4)
// _SafeStr_9037 = "_-32T" (String#32630, DoABC#4)
// _SafeStr_9038 = "_-uN" (String#31576, DoABC#4)
// _SafeStr_9039 = "_-IQ" (String#39822, DoABC#4)



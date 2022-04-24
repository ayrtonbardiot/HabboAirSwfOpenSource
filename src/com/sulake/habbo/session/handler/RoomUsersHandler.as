// by nota

//com.sulake.habbo.session.handler.RoomUsersHandler

package com.sulake.habbo.session.handler
{
    import _-Ol._SafeStr_530;
    import _-Ol._SafeStr_467;
    import _-W1K._SafeStr_797;
    import _-Ja._SafeStr_787;
    import _-Ol._SafeStr_327;
    import _-W1K._SafeStr_206;
    import _-b1c._SafeStr_579;
    import _-b1c._SafeStr_185;
    import _-b1c._SafeStr_862;
    import _-b1c._SafeStr_574;
    import _-b1c._SafeStr_708;
    import _-Z1z._SafeStr_284;
    import _-b1c._SafeStr_812;
    import _-b1c._SafeStr_257;
    import _-Z1z._SafeStr_581;
    import _-Z1z._SafeStr_139;
    import _-Z1z._SafeStr_383;
    import _-u7._SafeStr_745;
    import _-JS._SafeStr_230;
    import _-O1Z._SafeStr_305;
    import _-Ol._SafeStr_425;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import _-61T._SafeStr_1520;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session._SafeStr_3241;
    import com.sulake.habbo.session.events.RoomSessionFavouriteGroupUpdateEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-61T._SafeStr_1248;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.session.UserData;
    import com.sulake.room.utils.RoomShakingEffect;
    import com.sulake.habbo.session.events.RoomSessionUserDataUpdateEvent;
    import _-61T._SafeStr_1148;
    import com.sulake.habbo.session.events.RoomSessionUserBadgesEvent;
    import com.sulake.habbo.session.events.RoomSessionDoorbellEvent;
    import com.sulake.habbo.session.events.RoomSessionUserFigureUpdateEvent;
    import _-NF._SafeStr_1212;
    import _-PB._SafeStr_1147;
    import com.sulake.habbo.session.PetInfo;
    import com.sulake.habbo.session.events.RoomSessionPetInfoUpdateEvent;
    import _-PB._SafeStr_1226;
    import com.sulake.habbo.session.events.RoomSessionPetFigureUpdateEvent;
    import _-PB._SafeStr_1063;
    import com.sulake.habbo.session.events.RoomSessionPetBreedingResultEvent;
    import _-Zz._SafeStr_1237;
    import com.sulake.habbo.session.events.RoomSessionConfirmPetBreedingEvent;
    import _-Zz._SafeStr_1190;
    import com.sulake.habbo.session.events.RoomSessionConfirmPetBreedingResultEvent;
    import com.sulake.habbo.session.events.RoomSessionNestBreedingSuccessEvent;
    import _-Zz._SafeStr_1332;
    import com.sulake.habbo.session.events.RoomSessionPetBreedingEvent;
    import _-PB._SafeStr_1299;
    import com.sulake.habbo.session.events.RoomSessionPetStatusUpdateEvent;
    import _-PB._SafeStr_1364;
    import com.sulake.habbo.session.events.RoomSessionPetLevelUpdateEvent;
    import _-PB._SafeStr_1401;
    import com.sulake.habbo.session.events.RoomSessionPetCommandsUpdateEvent;
    import com.sulake.habbo.session.events.RoomSessionErrorMessageEvent;
    import _-wm._SafeStr_1232;
    import _-JS._SafeStr_1649;
    import com.sulake.habbo.session.events.RoomSessionFriendRequestEvent;
    import _-81O._SafeStr_1069;
    import com.sulake.habbo.session.events.RoomSessionDanceEvent;

    public class RoomUsersHandler extends BaseHandler 
    {

        public function RoomUsersHandler(_arg_1:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(_arg_1, _arg_2);
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addMessageEvent(new _SafeStr_530(onUsers));
            _arg_1.addMessageEvent(new _SafeStr_467(onUserRemove));
            _arg_1.addMessageEvent(new _SafeStr_797(onUserBadges));
            _arg_1.addMessageEvent(new _SafeStr_787(onDoorbell));
            _arg_1.addMessageEvent(new _SafeStr_327(onUserChange));
            _arg_1.addMessageEvent(new _SafeStr_206(onUserNameChange));
            _arg_1.addMessageEvent(new _SafeStr_579(onPetInfo));
            _arg_1.addMessageEvent(new _SafeStr_185(onEnabledPetCommands));
            _arg_1.addMessageEvent(new _SafeStr_862(onPetPlacingError));
            _arg_1.addMessageEvent(new _SafeStr_574(onPetFigureUpdate));
            _arg_1.addMessageEvent(new _SafeStr_708(onPetBreedingResult));
            _arg_1.addMessageEvent(new _SafeStr_284(onPetBreedingEvent));
            _arg_1.addMessageEvent(new _SafeStr_812(onPetStatusUpdate));
            _arg_1.addMessageEvent(new _SafeStr_257(onPetLevelUpdate));
            _arg_1.addMessageEvent(new _SafeStr_581(onConfirmPetBreeding));
            _arg_1.addMessageEvent(new _SafeStr_139(onConfirmPetBreedingResult));
            _arg_1.addMessageEvent(new _SafeStr_383(onNestBreedingSuccess));
            _arg_1.addMessageEvent(new _SafeStr_745(onBotError));
            _arg_1.addMessageEvent(new _SafeStr_230(onFriendRequest));
            _arg_1.addMessageEvent(new _SafeStr_305(onDance));
            _arg_1.addMessageEvent(new _SafeStr_425(onFavoriteMembershipUpdate));
        }

        private function onFavoriteMembershipUpdate(_arg_1:IMessageEvent):void
        {
            var _local_5:* = null;
            var _local_3:_SafeStr_1520 = _SafeStr_425(_arg_1).getParser();
            var _local_4:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_4 == null)
            {
                return;
            };
            var _local_2:_SafeStr_3241 = _local_4.userDataManager.getUserDataByIndex(_local_3.roomIndex);
            if (_local_2 == null)
            {
                return;
            };
            _local_2.groupID = ("" + _local_3.habboGroupId);
            _local_2.groupName = _local_3.habboGroupName;
            if (((listener) && (listener.events)))
            {
                _local_5 = new RoomSessionFavouriteGroupUpdateEvent(_local_4, _local_3.roomIndex, _local_3.habboGroupId, _local_3.status, _local_3.habboGroupName);
                listener.events.dispatchEvent(_local_5);
            };
        }

        private function onUsers(_arg_1:IMessageEvent):void
        {
            var _local_4:int;
            var _local_8:* = null;
            var _local_2:* = null;
            var _local_9:_SafeStr_530 = (_arg_1 as _SafeStr_530);
            if (_local_9 == null)
            {
                return;
            };
            var _local_3:_SafeStr_1248 = _local_9.getParser();
            var _local_5:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_5 == null)
            {
                return;
            };
            var _local_6:Boolean;
            var _local_7:Vector.<_SafeStr_3241> = new Vector.<_SafeStr_3241>(0);
            _local_4 = 0;
            while (_local_4 < _local_3.getUserCount())
            {
                _local_8 = _local_3.getUser(_local_4);
                _local_2 = new UserData(_local_8.roomIndex);
                _local_2.name = _local_8.name;
                _local_2.custom = _local_8.custom;
                _local_2.achievementScore = _local_8.achievementScore;
                _local_2.figure = _local_8.figure;
                _local_2.type = _local_8.userType;
                _local_2.webID = _local_8.webID;
                _local_2.groupID = _local_8.groupID;
                _local_2.groupName = _local_8.groupName;
                _local_2.groupStatus = _local_8.groupStatus;
                _local_2.sex = _local_8.sex;
                _local_2.ownerId = _local_8.ownerId;
                _local_2.ownerName = _local_8.ownerName;
                _local_2.rarityLevel = _local_8.rarityLevel;
                _local_2.hasSaddle = _local_8.hasSaddle;
                _local_2.isRiding = _local_8.isRiding;
                _local_2.canBreed = _local_8.canBreed;
                _local_2.canHarvest = _local_8.canHarvest;
                _local_2.canRevive = _local_8.canRevive;
                _local_2.hasBreedingPermission = _local_8.hasBreedingPermission;
                _local_2.petLevel = _local_8.petLevel;
                _local_2.botSkills = _local_8.botSkills;
                _local_2.isModerator = _local_8.isModerator;
                if ((((_local_8.userType == 4) && (_local_8.ownerId == -1)) && (_local_8.name == "Macklebee")))
                {
                    _local_6 = true;
                };
                if (_local_5.userDataManager.getUserData(_local_8.roomIndex) == null)
                {
                    _local_7.push(_local_2);
                };
                _local_5.userDataManager.setUserData(_local_2);
                _local_4++;
            };
            if (_local_6)
            {
                RoomShakingEffect.init(250, 5000);
                RoomShakingEffect.turnVisualizationOn();
            };
            listener.events.dispatchEvent(new RoomSessionUserDataUpdateEvent(_local_5, _local_7));
        }

        private function onUserRemove(_arg_1:IMessageEvent):void
        {
            var _local_4:_SafeStr_467 = (_arg_1 as _SafeStr_467);
            if (_local_4 == null)
            {
                return;
            };
            var _local_3:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:int = (_local_4.getParser() as _SafeStr_1148).id;
            _local_3.userDataManager.removeUserDataByRoomIndex(_local_2);
        }

        private function onUserBadges(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_797 = (_arg_1 as _SafeStr_797);
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_3 == null)
            {
                return;
            };
            _local_3.userDataManager.setUserBadges(_local_2.userId, _local_2.badges);
            listener.events.dispatchEvent(new RoomSessionUserBadgesEvent(_local_3, _local_2.userId, _local_2.badges));
        }

        private function onDoorbell(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_787 = (_arg_1 as _SafeStr_787);
            if (_local_2 == null)
            {
                return;
            };
            if (_local_2.userName == "")
            {
                return;
            };
            var _local_3:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_3 == null)
            {
                return;
            };
            listener.events.dispatchEvent(new RoomSessionDoorbellEvent("RSDE_DOORBELL", _local_3, _local_2.userName));
        }

        private function onUserChange(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_327 = (_arg_1 as _SafeStr_327);
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_2 == null)
            {
                return;
            };
            if (_local_3.id >= 0)
            {
                _local_2.userDataManager.updateFigure(_local_3.id, _local_3.figure, _local_3.sex, false, false);
                _local_2.userDataManager.updateCustom(_local_3.id, _local_3.customInfo);
                _local_2.userDataManager.updateAchievementScore(_local_3.id, _local_3.achievementScore);
                listener.events.dispatchEvent(new RoomSessionUserFigureUpdateEvent(_local_2, _local_3.id, _local_3.figure, _local_3.sex, _local_3.customInfo, _local_3.achievementScore));
            };
        }

        private function onUserNameChange(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_206 = (_arg_1 as _SafeStr_206);
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:_SafeStr_1212 = _local_2.getParser();
            var _local_4:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_4 == null)
            {
                return;
            };
            _local_4.userDataManager.updateNameByIndex(_local_3.id, _local_3.newName);
        }

        private function onPetInfo(_arg_1:IMessageEvent):void
        {
            var _local_5:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_5 == null)
            {
                return;
            };
            var _local_3:_SafeStr_579 = (_arg_1 as _SafeStr_579);
            if (_local_3 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1147 = _local_3.getParser();
            var _local_4:PetInfo = new PetInfo();
            _local_4.petId = _local_2.petId;
            _local_4.level = _local_2.level;
            _local_4.levelMax = _local_2.maxLevel;
            _local_4.experience = _local_2.experience;
            _local_4.experienceMax = _local_2.experienceRequiredToLevel;
            _local_4.energy = _local_2.energy;
            _local_4.energyMax = _local_2.maxEnergy;
            _local_4.nutrition = _local_2.nutrition;
            _local_4.nutritionMax = _local_2.maxNutrition;
            _local_4.ownerId = _local_2.ownerId;
            _local_4.ownerName = _local_2.ownerName;
            _local_4.respect = _local_2.respect;
            _local_4.age = _local_2.age;
            _local_4.breedId = _local_2.breedId;
            _local_4.hasFreeSaddle = _local_2.hasFreeSaddle;
            _local_4.isRiding = _local_2.isRiding;
            _local_4.canBreed = _local_2.canBreed;
            _local_4.canHarvest = _local_2.canHarvest;
            _local_4.rarityLevel = _local_2.rarityLevel;
            _local_4.canRevive = _local_2.canRevive;
            _local_4.skillTresholds = _local_2.skillTresholds;
            _local_4.accessRights = _local_2.accessRights;
            _local_4.maxWellBeingSeconds = _local_2.maxWellBeingSeconds;
            _local_4.remainingWellBeingSeconds = _local_2.remainingWellBeingSeconds;
            _local_4.remainingGrowingSeconds = _local_2.remainingGrowingSeconds;
            _local_4.hasBreedingPermission = _local_2.hasBreedingPermission;
            listener.events.dispatchEvent(new RoomSessionPetInfoUpdateEvent(_local_5, _local_4));
        }

        private function onPetFigureUpdate(_arg_1:IMessageEvent):void
        {
            var _local_7:_SafeStr_574 = (_arg_1 as _SafeStr_574);
            if (_local_7 == null)
            {
                return;
            };
            var _local_5:_SafeStr_1226 = _local_7.getParser();
            var _local_6:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_6 == null)
            {
                return;
            };
            var _local_8:String = _local_5.figureData.figureString;
            var _local_9:int = _local_5.roomIndex;
            var _local_3:int = _local_5.petId;
            var _local_2:Boolean = _local_5.hasSaddle;
            var _local_4:Boolean = _local_5.isRiding;
            _local_6.userDataManager.updateFigure(_local_9, _local_8, "", _local_2, _local_4);
            listener.events.dispatchEvent(new RoomSessionPetFigureUpdateEvent(_local_6, _local_3, _local_8));
        }

        private function onPetBreedingResult(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_708 = (_arg_1 as _SafeStr_708);
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:_SafeStr_1063 = _local_2.getParser();
            var _local_4:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_4 == null)
            {
                return;
            };
            listener.events.dispatchEvent(new RoomSessionPetBreedingResultEvent(_local_4, _local_3.resultData, _local_3.otherResultData));
        }

        private function onConfirmPetBreeding(_arg_1:_SafeStr_581):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1237 = (_arg_1.parser as _SafeStr_1237);
            var _local_3:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_3 == null)
            {
                return;
            };
            listener.events.dispatchEvent(new RoomSessionConfirmPetBreedingEvent(_local_3, _local_2.nestId, _local_2.pet1, _local_2.pet2, _local_2.rarityCategories, _local_2.resultPetType));
        }

        private function onConfirmPetBreedingResult(_arg_1:_SafeStr_139):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1190 = (_arg_1.parser as _SafeStr_1190);
            var _local_3:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_3 == null)
            {
                return;
            };
            listener.events.dispatchEvent(new RoomSessionConfirmPetBreedingResultEvent(_local_3, _local_2.breedingNestStuffId, _local_2.result));
        }

        private function onNestBreedingSuccess(_arg_1:_SafeStr_383):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_2 == null)
            {
                return;
            };
            listener.events.dispatchEvent(new RoomSessionNestBreedingSuccessEvent(_local_2, _arg_1.getParser().petId, _arg_1.getParser().rarityCategory));
        }

        private function onPetBreedingEvent(_arg_1:IMessageEvent):void
        {
            var _local_4:_SafeStr_284 = (_arg_1 as _SafeStr_284);
            if (_local_4 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1332 = _local_4.getParser();
            var _local_3:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_3 == null)
            {
                return;
            };
            listener.events.dispatchEvent(new RoomSessionPetBreedingEvent(_local_3, _local_2.state, _local_2.ownPetId, _local_2.otherPetId));
        }

        private function onPetStatusUpdate(_arg_1:IMessageEvent):void
        {
            var _local_8:_SafeStr_812 = (_arg_1 as _SafeStr_812);
            if (_local_8 == null)
            {
                return;
            };
            var _local_4:_SafeStr_1299 = _local_8.getParser();
            var _local_5:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_5 == null)
            {
                return;
            };
            var _local_9:int = _local_4.roomIndex;
            var _local_2:int = _local_4.petId;
            var _local_3:Boolean = _local_4.canHarvest;
            var _local_10:Boolean = _local_4.canRevive;
            var _local_7:Boolean = _local_4.canBreed;
            var _local_6:Boolean = _local_4.hasBreedingPermission;
            _local_5.userDataManager.updatePetBreedingStatus(_local_9, _local_7, _local_3, _local_10, _local_6);
            listener.events.dispatchEvent(new RoomSessionPetStatusUpdateEvent(_local_5, _local_2, _local_7, _local_3, _local_10, _local_6));
        }

        private function onPetLevelUpdate(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_257 = (_arg_1 as _SafeStr_257);
            if (_local_2 == null)
            {
                return;
            };
            var _local_4:_SafeStr_1364 = _local_2.getParser();
            var _local_6:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_6 == null)
            {
                return;
            };
            var _local_7:int = _local_4.roomIndex;
            var _local_3:int = _local_4.petId;
            var _local_5:int = _local_4.level;
            _local_6.userDataManager.updatePetLevel(_local_7, _local_5);
            listener.events.dispatchEvent(new RoomSessionPetLevelUpdateEvent(_local_6, _local_3, _local_5));
        }

        private function onEnabledPetCommands(_arg_1:IMessageEvent):void
        {
            var _local_4:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_4 == null)
            {
                return;
            };
            var _local_2:_SafeStr_185 = (_arg_1 as _SafeStr_185);
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:_SafeStr_1401 = _local_2.getParser();
            if (_local_3 != null)
            {
                listener.events.dispatchEvent(new RoomSessionPetCommandsUpdateEvent(_local_4, _local_3.petId, _local_3.allCommands, _local_3.enabledCommands));
            };
        }

        private function onPetPlacingError(_arg_1:_SafeStr_862):void
        {
            var _local_3:* = null;
            if (((_arg_1 == null) || (_arg_1.getParser() == null)))
            {
                return;
            };
            var _local_2:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_2 == null)
            {
                return;
            };
            switch (_arg_1.getParser().errorCode)
            {
                case 0:
                    _local_3 = "RSEME_PETS_FORBIDDEN_IN_HOTEL";
                    break;
                case 1:
                    _local_3 = "RSEME_PETS_FORBIDDEN_IN_FLAT";
                    break;
                case 2:
                    _local_3 = "RSEME_MAX_PETS";
                    break;
                case 3:
                    _local_3 = "RSEME_NO_FREE_TILES_FOR_PET";
                    break;
                case 4:
                    _local_3 = "RSEME_SELECTED_TILE_NOT_FREE_FOR_PET";
                    break;
                case 5:
                    _local_3 = "RSEME_MAX_NUMBER_OF_OWN_PETS";
                default:
            };
            if (_local_3 != null)
            {
                listener.events.dispatchEvent(new RoomSessionErrorMessageEvent(_local_3, _local_2));
            };
        }

        private function onBotError(_arg_1:_SafeStr_745):void
        {
            var _local_3:* = null;
            if (((_arg_1 == null) || (_arg_1.getParser() == null)))
            {
                return;
            };
            var _local_2:IRoomSession = listener.getSession(_SafeStr_3937);
            if (_local_2 == null)
            {
                return;
            };
            switch (_arg_1.getParser().errorCode)
            {
                case 0:
                    _local_3 = "RSEME_BOTS_FORBIDDEN_IN_HOTEL";
                    break;
                case 1:
                    _local_3 = "RSEME_BOTS_FORBIDDEN_IN_FLAT";
                    break;
                case 2:
                    _local_3 = "RSEME_BOT_LIMIT_REACHED";
                    break;
                case 3:
                    _local_3 = "RSEME_SELECTED_TILE_NOT_FREE_FOR_BOT";
                    break;
                case 4:
                    _local_3 = "RSEME_BOT_NAME_NOT_ACCEPTED";
                default:
            };
            if (_local_3 != null)
            {
                listener.events.dispatchEvent(new RoomSessionErrorMessageEvent(_local_3, _local_2));
            };
        }

        private function onFriendRequest(_arg_1:_SafeStr_230):void
        {
            if ((((!(_arg_1)) || (!(listener))) || (!(listener.events))))
            {
                return;
            };
            var _local_2:_SafeStr_1232 = _arg_1.getParser();
            if (!_local_2)
            {
                return;
            };
            var _local_4:IRoomSession = listener.getSession(_SafeStr_3937);
            if (!_local_4)
            {
                return;
            };
            var _local_3:_SafeStr_1649 = _local_2.req;
            if (!_local_3)
            {
                return;
            };
            listener.events.dispatchEvent(new RoomSessionFriendRequestEvent(_local_4, _local_3.requestId, _local_3.requestId, _local_3.requesterName));
        }

        private function onDance(_arg_1:_SafeStr_305):void
        {
            var _local_2:_SafeStr_1069 = _arg_1.getParser();
            var _local_3:IRoomSession = listener.getSession(_SafeStr_3937);
            listener.events.dispatchEvent(new RoomSessionDanceEvent(_local_3, _local_2.userId, _local_2.danceStyle));
        }


    }
}//package com.sulake.habbo.session.handler

// _SafeStr_1063 = "_-ae" (String#31673, DoABC#4)
// _SafeStr_1069 = "_-023" (String#28520, DoABC#4)
// _SafeStr_1147 = "_-z1y" (String#32730, DoABC#4)
// _SafeStr_1148 = "_-w1L" (String#30259, DoABC#4)
// _SafeStr_1190 = "_-M1u" (String#28366, DoABC#4)
// _SafeStr_1212 = "_-i1F" (String#23205, DoABC#4)
// _SafeStr_1226 = "_-LJ" (String#30563, DoABC#4)
// _SafeStr_1232 = "_-G1x" (String#28910, DoABC#4)
// _SafeStr_1237 = "_-bp" (String#29755, DoABC#4)
// _SafeStr_1248 = "_-mE" (String#24740, DoABC#4)
// _SafeStr_1299 = "_-N1d" (String#40784, DoABC#4)
// _SafeStr_1332 = "_-2Z" (String#38602, DoABC#4)
// _SafeStr_1364 = "_-6d" (String#38719, DoABC#4)
// _SafeStr_139 = "_-CG" (String#23622, DoABC#4)
// _SafeStr_1401 = "_-KX" (String#39865, DoABC#4)
// _SafeStr_1520 = "_-X1o" (String#36698, DoABC#4)
// _SafeStr_1562 = "_-d1I" (String#24717, DoABC#4)
// _SafeStr_1649 = "_-v1E" (String#15412, DoABC#4)
// _SafeStr_185 = "_-I1m" (String#18901, DoABC#4)
// _SafeStr_206 = "_-tP" (String#6892, DoABC#4)
// _SafeStr_230 = "_-SR" (String#7982, DoABC#4)
// _SafeStr_257 = "_-Wr" (String#19171, DoABC#4)
// _SafeStr_284 = "_-ad" (String#18984, DoABC#4)
// _SafeStr_305 = "_-b1O" (String#11082, DoABC#4)
// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)
// _SafeStr_327 = "_-Uf" (String#3336, DoABC#4)
// _SafeStr_383 = "_-P1p" (String#26405, DoABC#4)
// _SafeStr_3937 = "_-jF" (String#1979, DoABC#4)
// _SafeStr_425 = "_-O0" (String#23774, DoABC#4)
// _SafeStr_467 = "_-q1q" (String#9851, DoABC#4)
// _SafeStr_530 = "_-sr" (String#6833, DoABC#4)
// _SafeStr_574 = "_-aQ" (String#10025, DoABC#4)
// _SafeStr_579 = "_-5q" (String#22177, DoABC#4)
// _SafeStr_581 = "_-zW" (String#24495, DoABC#4)
// _SafeStr_708 = "_-m1v" (String#21709, DoABC#4)
// _SafeStr_745 = "_-71f" (String#27950, DoABC#4)
// _SafeStr_787 = "_-9t" (String#5939, DoABC#4)
// _SafeStr_797 = "_-Ax" (String#6747, DoABC#4)
// _SafeStr_812 = "_-PR" (String#18651, DoABC#4)
// _SafeStr_862 = "_-X1V" (String#25224, DoABC#4)



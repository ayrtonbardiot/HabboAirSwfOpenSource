// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.RoomSession

package com.sulake.habbo.session
{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import _-n1H._SafeStr_1625;
    import _-IR._SafeStr_913;
    import _-PD.Game2GameChatMessageComposer;
    import _-21B._SafeStr_660;
    import flash.utils.getTimer;
    import _-L1z._SafeStr_697;
    import _-21B._SafeStr_769;
    import _-21B._SafeStr_798;
    import _-21B._SafeStr_930;
    import _-21B._SafeStr_788;
    import _-L1z._SafeStr_986;
    import _-L1z._SafeStr_550;
    import _-L1z._SafeStr_684;
    import _-L1z._SafeStr_866;
    import _-02a._SafeStr_992;
    import _-02a._SafeStr_722;
    import _-02a._SafeStr_370;
    import _-02a._SafeStr_628;
    import _-02a._SafeStr_742;
    import _-02a._SafeStr_540;
    import _-qv._SafeStr_895;
    import _-G1z._SafeStr_293;
    import _-G1z._SafeStr_710;
    import _-G1z._SafeStr_160;
    import _-8c._SafeStr_882;
    import _-8c._SafeStr_356;
    import _-Po._SafeStr_838;
    import _-p1Y._SafeStr_458;
    import _-p1Y._SafeStr_974;
    import _-p1Y._SafeStr_619;
    import _-p1Y._SafeStr_229;
    import _-p1Y._SafeStr_497;
    import _-p1Y._SafeStr_561;
    import _-p1Y._SafeStr_517;
    import _-p1Y._SafeStr_328;
    import _-j1G._SafeStr_145;
    import _-j1G._SafeStr_980;
    import _-j1G._SafeStr_962;
    import _-j1G._SafeStr_399;
    import _-j1G._SafeStr_487;
    import _-j1G._SafeStr_137;
    import _-j1G._SafeStr_187;
    import _-j1G._SafeStr_896;
    import _-m1i._SafeStr_778;
    import _-j1G._SafeStr_558;
    import _-IS._SafeStr_758;
    import _-IR._SafeStr_316;
    import _-IR._SafeStr_154;
    import _-j1G._SafeStr_482;

    public class RoomSession implements IRoomSession 
    {

        private const CHAT_LAG_WARNING_LIMIT:int = 2500;

        private var _connection:IConnection;
        private var _SafeStr_3693:int = 0;
        private var _SafeStr_3951:String = "";
        private var _SafeStr_5017:String = "";
        private var _SafeStr_5015:IMessageComposer = null;
        private var _SafeStr_3734:String = "RSE_CREATED";
        private var _SafeStr_5013:UserDataManager;
        private var _SafeStr_5019:int = -1;
        private var _SafeStr_5020:Boolean = false;
        private var _SafeStr_5021:int = 0;
        private var _SafeStr_5022:int = 0;
        private var _isGuildRoom:Boolean = false;
        private var _SafeStr_5024:Boolean = false;
        private var _SafeStr_5025:Boolean = false;
        private var _SafeStr_5023:int;
        private var _SafeStr_5014:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_5018:int = 0;
        private var _habboTracking:_SafeStr_1704 = null;
        private var _SafeStr_5026:Boolean = false;
        private var _isGameSession:Boolean = false;
        private var _SafeStr_5027:Boolean = false;
        private var _SafeStr_5016:_SafeStr_1625 = null;

        public function RoomSession()
        {
            _SafeStr_5013 = new UserDataManager();
        }

        public function set connection(_arg_1:IConnection):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _connection = _arg_1;
            if (_SafeStr_5013 != null)
            {
                _SafeStr_5013.connection = _arg_1;
            };
        }

        public function dispose():void
        {
            _connection = null;
            if (_SafeStr_5013 != null)
            {
                _SafeStr_5013.dispose();
                _SafeStr_5013 = null;
            };
            if (_SafeStr_5014 != null)
            {
                _SafeStr_5014.dispose();
                _SafeStr_5014 = null;
            };
            if (_SafeStr_5015)
            {
                _SafeStr_5015.dispose();
                _SafeStr_5015 = null;
            };
            if (_SafeStr_5016 != null)
            {
                _SafeStr_5016 = null;
            };
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function set roomId(_arg_1:int):void
        {
            _SafeStr_3693 = _arg_1;
        }

        public function get roomPassword():String
        {
            return (_SafeStr_3951);
        }

        public function set roomPassword(_arg_1:String):void
        {
            _SafeStr_3951 = _arg_1;
        }

        public function get roomResources():String
        {
            return (_SafeStr_5017);
        }

        public function set roomResources(_arg_1:String):void
        {
            _SafeStr_5017 = _arg_1;
        }

        public function get openConnectionComposer():IMessageComposer
        {
            return (_SafeStr_5015);
        }

        public function set openConnectionComposer(_arg_1:IMessageComposer):void
        {
            _SafeStr_5015 = _arg_1;
        }

        public function get state():String
        {
            return (_SafeStr_3734);
        }

        public function get habboTracking():_SafeStr_1704
        {
            return (_habboTracking);
        }

        public function set habboTracking(_arg_1:_SafeStr_1704):void
        {
            _habboTracking = _arg_1;
        }

        public function get isGameSession():Boolean
        {
            return (_isGameSession);
        }

        public function set isGameSession(_arg_1:Boolean):void
        {
            _isGameSession = _arg_1;
        }

        public function get roomModerationSettings():_SafeStr_1625
        {
            return (_SafeStr_5016);
        }

        public function set roomModerationSettings(_arg_1:_SafeStr_1625):void
        {
            _SafeStr_5016 = _arg_1;
        }

        public function trackEventLogOncePerSession(_arg_1:String, _arg_2:String, _arg_3:String):void
        {
            _habboTracking.trackEventLogOncePerSession(_arg_1, _arg_2, _arg_3);
        }

        public function start():Boolean
        {
            if (((_SafeStr_3734 == "RSE_CREATED") && (!(_connection == null))))
            {
                _SafeStr_3734 = "RSE_STARTED";
                if (_SafeStr_5015)
                {
                    return (sendPredefinedOpenConnection());
                };
                return (sendOpenFlatConnectionMessage());
            };
            return (false);
        }

        public function reset(_arg_1:int):void
        {
            if (_arg_1 != _SafeStr_3693)
            {
                _SafeStr_3693 = _arg_1;
                _SafeStr_5020 = false;
                _SafeStr_5021 = 0;
                _SafeStr_5022 = 0;
                _SafeStr_5024 = false;
            };
        }

        private function sendOpenFlatConnectionMessage():Boolean
        {
            if (_connection == null)
            {
                return (false);
            };
            _connection.send(new _SafeStr_913(_SafeStr_3693, _SafeStr_3951));
            return (true);
        }

        private function sendPredefinedOpenConnection():Boolean
        {
            if (_connection == null)
            {
                return (false);
            };
            _connection.send(_SafeStr_5015);
            _SafeStr_5015 = null;
            return (true);
        }

        public function sendChatMessage(_arg_1:String, _arg_2:int=0):void
        {
            if (_isGameSession)
            {
                _connection.send(new Game2GameChatMessageComposer(_arg_1));
            }
            else
            {
                _arg_1 = _arg_1.replace(/&#[0-9]+;/g, "");
                _connection.send(new _SafeStr_660(_arg_1, _arg_2, _SafeStr_5018));
                _SafeStr_5014.add(_SafeStr_5018, getTimer());
                _SafeStr_5018++;
            };
        }

        public function sendChangeMottoMessage(_arg_1:String):void
        {
            _connection.send(new _SafeStr_697(_arg_1));
        }

        public function receivedChatWithTrackingId(_arg_1:int):void
        {
            var _local_3:int;
            var _local_2:Object = _SafeStr_5014.remove(_arg_1);
            if (_local_2 != null)
            {
                _local_3 = getTimer();
                if ((_local_3 - _local_2) > 2500)
                {
                    if (_habboTracking != null)
                    {
                        _habboTracking.chatLagDetected(_local_3);
                    };
                };
            };
        }

        public function sendShoutMessage(_arg_1:String, _arg_2:int=0):void
        {
            _connection.send(new _SafeStr_769(_arg_1, _arg_2));
        }

        public function sendWhisperMessage(_arg_1:String, _arg_2:String, _arg_3:int=0):void
        {
            _connection.send(new _SafeStr_798(_arg_1, _arg_2, _arg_3));
        }

        public function sendChatTypingMessage(_arg_1:Boolean):void
        {
            if (_arg_1)
            {
                _connection.send(new _SafeStr_930());
            }
            else
            {
                _connection.send(new _SafeStr_788());
            };
        }

        public function sendAvatarExpressionMessage(_arg_1:int):void
        {
            _connection.send(new _SafeStr_986(_arg_1));
        }

        public function sendSignMessage(_arg_1:int):void
        {
            if (((_arg_1 >= 0) && (_arg_1 <= 17)))
            {
                _connection.send(new _SafeStr_550(_arg_1));
            };
        }

        public function sendDanceMessage(_arg_1:int):void
        {
            _connection.send(new _SafeStr_684(_arg_1));
        }

        public function sendChangePostureMessage(_arg_1:int):void
        {
            _connection.send(new _SafeStr_866(_arg_1));
        }

        public function sendCreditFurniRedeemMessage(_arg_1:int):void
        {
            _connection.send(new _SafeStr_992(_arg_1));
        }

        public function sendPresentOpenMessage(_arg_1:int):void
        {
            _connection.send(new _SafeStr_722(_arg_1));
        }

        public function sendOpenPetPackageMessage(_arg_1:int, _arg_2:String):void
        {
            _connection.send(new _SafeStr_370(_arg_1, _arg_2));
        }

        public function sendRoomDimmerGetPresetsMessage():void
        {
            _connection.send(new _SafeStr_628());
        }

        public function sendRoomDimmerSavePresetMessage(_arg_1:int, _arg_2:int, _arg_3:uint, _arg_4:int, _arg_5:Boolean):void
        {
            var _local_6:String = ("000000" + _arg_3.toString(16).toUpperCase());
            var _local_7:String = ("#" + _local_6.substr((_local_6.length - 6)));
            _connection.send(new _SafeStr_742(_arg_1, _arg_2, _local_7, _arg_4, _arg_5));
        }

        public function sendRoomDimmerChangeStateMessage():void
        {
            _connection.send(new _SafeStr_540());
        }

        public function sendConversionPoint(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String=null, _arg_5:int=0):void
        {
            _connection.send(new _SafeStr_895(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5));
        }

        public function sendPollStartMessage(_arg_1:int):void
        {
            _connection.send(new _SafeStr_293(_arg_1));
        }

        public function sendPollRejectMessage(_arg_1:int):void
        {
            _connection.send(new _SafeStr_710(_arg_1));
        }

        public function sendPollAnswerMessage(_arg_1:int, _arg_2:int, _arg_3:Array):void
        {
            _connection.send(new _SafeStr_160(_arg_1, _arg_2, _arg_3));
        }

        public function sendPeerUsersClassificationMessage(_arg_1:String):void
        {
            _connection.send(new _SafeStr_882(_arg_1));
        }

        public function sendRoomUsersClassificationMessage(_arg_1:String):void
        {
            _connection.send(new _SafeStr_356(_arg_1));
        }

        public function sendVisitFlatMessage(_arg_1:int):void
        {
            _connection.send(new _SafeStr_913(_arg_1));
        }

        public function sendVisitUserMessage(_arg_1:String):void
        {
            _connection.send(new _SafeStr_838(_arg_1));
        }

        public function ambassadorAlert(_arg_1:int):void
        {
            _connection.send(new _SafeStr_458(_arg_1));
        }

        public function kickUser(_arg_1:int):void
        {
            _connection.send(new _SafeStr_974(_arg_1));
        }

        public function banUserWithDuration(_arg_1:int, _arg_2:String):void
        {
            _connection.send(new _SafeStr_619(_arg_1, _arg_2, roomId));
        }

        public function muteUser(_arg_1:int, _arg_2:int):void
        {
            _connection.send(new _SafeStr_229(_arg_1, _arg_2, roomId));
        }

        public function unmuteUser(_arg_1:int):void
        {
            _connection.send(new _SafeStr_497(_arg_1, roomId));
        }

        public function assignRights(_arg_1:int):void
        {
            _connection.send(new _SafeStr_561(_arg_1));
        }

        public function removeRights(_arg_1:int):void
        {
            var _local_3:Array = [];
            _local_3.push(_arg_1);
            var _local_2:_SafeStr_517 = new _SafeStr_517(_local_3);
            _connection.send(_local_2);
        }

        public function letUserIn(_arg_1:String, _arg_2:Boolean):void
        {
            _connection.send(new _SafeStr_328(_arg_1, _arg_2));
        }

        public function pickUpPet(_arg_1:int):void
        {
            _connection.send(new _SafeStr_145(_arg_1));
        }

        public function mountPet(_arg_1:int):void
        {
            _connection.send(new _SafeStr_980(_arg_1, true));
        }

        public function togglePetRidingPermission(_arg_1:int):void
        {
            _connection.send(new _SafeStr_962(_arg_1));
        }

        public function togglePetBreedingPermission(_arg_1:int):void
        {
            _connection.send(new _SafeStr_399(_arg_1));
        }

        public function dismountPet(_arg_1:int):void
        {
            _connection.send(new _SafeStr_980(_arg_1, false));
        }

        public function removeSaddleFromPet(_arg_1:int):void
        {
            _connection.send(new _SafeStr_487(_arg_1));
        }

        public function harvestPet(_arg_1:int):void
        {
            _connection.send(new _SafeStr_137(_arg_1));
        }

        public function compostPlant(_arg_1:int):void
        {
            _connection.send(new _SafeStr_187(_arg_1));
        }

        public function requestPetCommands(_arg_1:int):void
        {
            _connection.send(new _SafeStr_896(_arg_1));
        }

        public function useProductForPet(_arg_1:int, _arg_2:int):void
        {
            _connection.send(new _SafeStr_778(_arg_1, _arg_2));
        }

        public function plantSeed(_arg_1:int):void
        {
            _connection.send(new _SafeStr_558(_arg_1));
        }

        public function sendScriptProceed():void
        {
            _connection.send(new _SafeStr_758());
        }

        public function quit():void
        {
            if (_connection != null)
            {
                _connection.send(new _SafeStr_316());
            };
        }

        public function changeQueue(_arg_1:int):void
        {
            if (_connection == null)
            {
                return;
            };
            _connection.send(new _SafeStr_154(_arg_1));
        }

        public function sendUpdateClothingChangeFurniture(_arg_1:int, _arg_2:String, _arg_3:String):void
        {
            if (_connection == null)
            {
                return;
            };
            var _local_4:_SafeStr_482 = new _SafeStr_482(_arg_1, _arg_2, _arg_3);
            _connection.send(_local_4);
            _local_4.dispose();
            _local_4 = null;
        }

        public function get userDataManager():_SafeStr_3273
        {
            return (_SafeStr_5013 as _SafeStr_3273);
        }

        public function get ownUserRoomId():int
        {
            return (_SafeStr_5019);
        }

        public function set ownUserRoomId(_arg_1:int):void
        {
            _SafeStr_5019 = _arg_1;
        }

        public function set isRoomOwner(_arg_1:Boolean):void
        {
            _SafeStr_5020 = _arg_1;
        }

        public function get isRoomOwner():Boolean
        {
            return (_SafeStr_5020);
        }

        public function set roomControllerLevel(_arg_1:int):void
        {
            if (((_arg_1 >= 0) && (_arg_1 <= 5)))
            {
                _SafeStr_5021 = _arg_1;
            }
            else
            {
                _SafeStr_14.log((("Invalid roomControllerLevel " + _arg_1) + ", setting to ROOM_CONTROL_LEVEL_NONE instead"));
                _SafeStr_5021 = 0;
            };
        }

        public function get roomControllerLevel():int
        {
            return (_SafeStr_5021);
        }

        public function get tradeMode():int
        {
            return (_SafeStr_5022);
        }

        public function get isPrivateRoom():Boolean
        {
            return (true);
        }

        public function set tradeMode(_arg_1:int):void
        {
            _SafeStr_5022 = _arg_1;
        }

        public function get isGuildRoom():Boolean
        {
            return (_isGuildRoom);
        }

        public function set isGuildRoom(_arg_1:Boolean):void
        {
            _isGuildRoom = _arg_1;
        }

        public function get isNoobRoom():Boolean
        {
            return (_SafeStr_5023 == 4);
        }

        public function set doorMode(_arg_1:int):void
        {
            _SafeStr_5023 = _arg_1;
        }

        public function get isSpectatorMode():Boolean
        {
            return (_SafeStr_5024);
        }

        public function set isSpectatorMode(_arg_1:Boolean):void
        {
            _SafeStr_5024 = _arg_1;
        }

        public function get arePetsAllowed():Boolean
        {
            return (_SafeStr_5025);
        }

        public function set arePetsAllowed(_arg_1:Boolean):void
        {
            _SafeStr_5025 = _arg_1;
        }

        public function get areBotsAllowed():Boolean
        {
            return (_SafeStr_5020);
        }

        public function get isUserDecorating():Boolean
        {
            return (_SafeStr_5026);
        }

        public function set isUserDecorating(_arg_1:Boolean):void
        {
            _SafeStr_5026 = _arg_1;
        }

        public function get isNuxNotComplete():Boolean
        {
            return (_SafeStr_5027);
        }

        public function set isNuxNotComplete(_arg_1:Boolean):void
        {
            _SafeStr_5027 = _arg_1;
        }


    }
}//package com.sulake.habbo.session

// _SafeStr_137 = "_-nJ" (String#29081, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_145 = "_-31e" (String#30574, DoABC#4)
// _SafeStr_154 = "_-I1B" (String#31222, DoABC#4)
// _SafeStr_160 = "_-m1E" (String#28866, DoABC#4)
// _SafeStr_1625 = "_-Ug" (String#7994, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_187 = "_-P1k" (String#28608, DoABC#4)
// _SafeStr_229 = "_-v18" (String#29630, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_293 = "_-G7" (String#29948, DoABC#4)
// _SafeStr_316 = "_-hs" (String#6384, DoABC#4)
// _SafeStr_3273 = "_-ut" (String#11180, DoABC#4)
// _SafeStr_328 = "_-Ef" (String#29757, DoABC#4)
// _SafeStr_356 = "_-Wd" (String#29356, DoABC#4)
// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_370 = "_-O14" (String#28768, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_3951 = "_-d1A" (String#4259, DoABC#4)
// _SafeStr_399 = "_-Gu" (String#30560, DoABC#4)
// _SafeStr_458 = "_-On" (String#31199, DoABC#4)
// _SafeStr_482 = "_-L1o" (String#22756, DoABC#4)
// _SafeStr_487 = "_-A8" (String#31365, DoABC#4)
// _SafeStr_497 = "_-Vq" (String#28929, DoABC#4)
// _SafeStr_5013 = "_-51K" (String#7524, DoABC#4)
// _SafeStr_5014 = "_-R1V" (String#8026, DoABC#4)
// _SafeStr_5015 = "_-y1y" (String#6490, DoABC#4)
// _SafeStr_5016 = "_-32x" (String#10825, DoABC#4)
// _SafeStr_5017 = "_-f1J" (String#15892, DoABC#4)
// _SafeStr_5018 = "_-E1s" (String#13090, DoABC#4)
// _SafeStr_5019 = "_-ia" (String#18078, DoABC#4)
// _SafeStr_5020 = "_-gX" (String#6609, DoABC#4)
// _SafeStr_5021 = "_-2V" (String#6082, DoABC#4)
// _SafeStr_5022 = "_-r8" (String#12441, DoABC#4)
// _SafeStr_5023 = "_-3h" (String#8839, DoABC#4)
// _SafeStr_5024 = "_-jC" (String#7259, DoABC#4)
// _SafeStr_5025 = "_-XW" (String#19166, DoABC#4)
// _SafeStr_5026 = "_-VO" (String#19199, DoABC#4)
// _SafeStr_5027 = "_-02o" (String#20212, DoABC#4)
// _SafeStr_517 = "_-12l" (String#13845, DoABC#4)
// _SafeStr_540 = "_-tr" (String#29914, DoABC#4)
// _SafeStr_550 = "_-l11" (String#29399, DoABC#4)
// _SafeStr_558 = "_-z11" (String#4154, DoABC#4)
// _SafeStr_561 = "_-Li" (String#18948, DoABC#4)
// _SafeStr_619 = "_-PJ" (String#31362, DoABC#4)
// _SafeStr_628 = "_-02r" (String#29495, DoABC#4)
// _SafeStr_660 = "_-51g" (String#19804, DoABC#4)
// _SafeStr_684 = "_-12p" (String#29460, DoABC#4)
// _SafeStr_697 = "_-t1A" (String#29018, DoABC#4)
// _SafeStr_710 = "_-S1H" (String#29184, DoABC#4)
// _SafeStr_722 = "_-1G" (String#29274, DoABC#4)
// _SafeStr_742 = "_-3v" (String#28881, DoABC#4)
// _SafeStr_758 = "_-I1Y" (String#31234, DoABC#4)
// _SafeStr_769 = "_-d1v" (String#28711, DoABC#4)
// _SafeStr_778 = "_-bc" (String#29973, DoABC#4)
// _SafeStr_788 = "_-D1L" (String#30248, DoABC#4)
// _SafeStr_798 = "_-7g" (String#28770, DoABC#4)
// _SafeStr_838 = "_-41a" (String#31367, DoABC#4)
// _SafeStr_866 = "_-KB" (String#29854, DoABC#4)
// _SafeStr_882 = "_-32t" (String#30407, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)
// _SafeStr_896 = "_-7X" (String#28965, DoABC#4)
// _SafeStr_913 = "_-02x" (String#10196, DoABC#4)
// _SafeStr_930 = "_-Xh" (String#29341, DoABC#4)
// _SafeStr_962 = "_-w10" (String#30358, DoABC#4)
// _SafeStr_974 = "_-y1m" (String#29129, DoABC#4)
// _SafeStr_980 = "_-F13" (String#18634, DoABC#4)
// _SafeStr_986 = "_-la" (String#28709, DoABC#4)
// _SafeStr_992 = "_-R1z" (String#29403, DoABC#4)



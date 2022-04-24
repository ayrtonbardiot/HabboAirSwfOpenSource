// by nota

//_-Ja._SafeStr_1569

package _-Ja
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1569 implements _SafeStr_13 
    {

        private const _SafeStr_7284:int = 1;
        private const _SafeStr_7285:int = 2;
        private const _SafeStr_7286:int = 4;
        private const _SafeStr_7287:int = 8;
        private const _SafeStr_7288:int = 16;
        private const _SafeStr_7289:int = 32;

        private var _flatId:int;
        private var _roomName:String;
        private var _SafeStr_7290:Boolean;
        private var _SafeStr_5226:int;
        private var _ownerName:String;
        private var _SafeStr_5023:int;
        private var _SafeStr_6279:int;
        private var _SafeStr_7291:int;
        private var _description:String;
        private var _SafeStr_5022:int;
        private var _SafeStr_5367:int;
        private var _SafeStr_7292:int;
        private var _SafeStr_4674:int;
        private var _SafeStr_7293:int;
        private var _SafeStr_6204:int = 0;
        private var _groupName:String = "";
        private var _SafeStr_7294:String = "";
        private var _SafeStr_4429:Array = [];
        private var _SafeStr_7283:_SafeStr_1676;
        private var _SafeStr_7295:Boolean;
        private var _SafeStr_7296:Boolean;
        private var _SafeStr_7297:String = "";
        private var _SafeStr_7298:String = "";
        private var _SafeStr_7299:int = 0;
        private var _SafeStr_7300:Boolean;
        private var _SafeStr_7301:Boolean;
        private var _disposed:Boolean;
        private var _SafeStr_7302:String = null;

        public function _SafeStr_1569(_arg_1:IMessageDataWrapper)
        {
            var _local_4:int;
            var _local_5:* = null;
            super();
            _flatId = _arg_1.readInteger();
            _roomName = _arg_1.readString();
            _SafeStr_5226 = _arg_1.readInteger();
            _ownerName = _arg_1.readString();
            _SafeStr_5023 = _arg_1.readInteger();
            _SafeStr_6279 = _arg_1.readInteger();
            _SafeStr_7291 = _arg_1.readInteger();
            _description = _arg_1.readString();
            _SafeStr_5022 = _arg_1.readInteger();
            _SafeStr_5367 = _arg_1.readInteger();
            _SafeStr_7292 = _arg_1.readInteger();
            _SafeStr_4674 = _arg_1.readInteger();
            var _local_3:int = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_5 = _arg_1.readString();
                _SafeStr_4429.push(_local_5);
                _local_4++;
            };
            var _local_2:int = _arg_1.readInteger();
            if ((_local_2 & 0x01) > 0)
            {
                _SafeStr_7302 = _arg_1.readString();
            };
            if ((_local_2 & 0x02) > 0)
            {
                _SafeStr_6204 = _arg_1.readInteger();
                _groupName = _arg_1.readString();
                _SafeStr_7294 = _arg_1.readString();
            };
            if ((_local_2 & 0x04) > 0)
            {
                _SafeStr_7297 = _arg_1.readString();
                _SafeStr_7298 = _arg_1.readString();
                _SafeStr_7299 = _arg_1.readInteger();
            };
            _SafeStr_7290 = ((_local_2 & 0x08) > 0);
            _SafeStr_7295 = ((_local_2 & 0x10) > 0);
            _SafeStr_7296 = ((_local_2 & 0x20) > 0);
            _SafeStr_7283 = new _SafeStr_1676(null);
            _SafeStr_7283.setDefaults();
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            this._SafeStr_4429 = null;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get flatId():int
        {
            return (_flatId);
        }

        public function get roomName():String
        {
            return (_roomName);
        }

        public function get showOwner():Boolean
        {
            return (_SafeStr_7290);
        }

        public function get ownerId():int
        {
            return (_SafeStr_5226);
        }

        public function get ownerName():String
        {
            return (_ownerName);
        }

        public function get doorMode():int
        {
            return (_SafeStr_5023);
        }

        public function get userCount():int
        {
            return (_SafeStr_6279);
        }

        public function get maxUserCount():int
        {
            return (_SafeStr_7291);
        }

        public function get description():String
        {
            return (_description);
        }

        public function get tradeMode():int
        {
            return (_SafeStr_5022);
        }

        public function get score():int
        {
            return (_SafeStr_5367);
        }

        public function get ranking():int
        {
            return (_SafeStr_7292);
        }

        public function get categoryId():int
        {
            return (_SafeStr_4674);
        }

        public function get habboGroupId():int
        {
            return (_SafeStr_6204);
        }

        public function get groupName():String
        {
            return (_groupName);
        }

        public function get groupBadgeCode():String
        {
            return (_SafeStr_7294);
        }

        public function get tags():Array
        {
            return (_SafeStr_4429);
        }

        public function get thumbnail():_SafeStr_1676
        {
            return (_SafeStr_7283);
        }

        public function get allowPets():Boolean
        {
            return (_SafeStr_7295);
        }

        public function get displayRoomEntryAd():Boolean
        {
            return (_SafeStr_7296);
        }

        public function get roomAdName():String
        {
            return (_SafeStr_7297);
        }

        public function get roomAdDescription():String
        {
            return (_SafeStr_7298);
        }

        public function get roomAdExpiresInMin():int
        {
            return (_SafeStr_7299);
        }

        public function get allInRoomMuted():Boolean
        {
            return (_SafeStr_7300);
        }

        public function get officialRoomPicRef():String
        {
            return (_SafeStr_7302);
        }

        public function set allInRoomMuted(_arg_1:Boolean):void
        {
            _SafeStr_7300 = _arg_1;
        }

        public function set roomName(_arg_1:String):void
        {
            _roomName = _arg_1;
        }

        public function get canMute():Boolean
        {
            return (_SafeStr_7301);
        }

        public function set canMute(_arg_1:Boolean):void
        {
            _SafeStr_7301 = _arg_1;
        }


    }
}//package _-Ja

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1569 = "_-R1p" (String#8356, DoABC#3)
// _SafeStr_1676 = "_-vy" (String#10433, DoABC#3)
// _SafeStr_4429 = "_-91w" (String#7179, DoABC#3)
// _SafeStr_4674 = "_-k10" (String#9658, DoABC#3)
// _SafeStr_5022 = "_-r8" (String#10148, DoABC#3)
// _SafeStr_5023 = "_-3h" (String#6786, DoABC#3)
// _SafeStr_5226 = "_-Ld" (String#7981, DoABC#3)
// _SafeStr_5367 = "_-z1J" (String#10657, DoABC#3)
// _SafeStr_6204 = "_-Gj" (String#7641, DoABC#3)
// _SafeStr_6279 = "_-tN" (String#10281, DoABC#3)
// _SafeStr_7283 = "_-e1g" (String#9281, DoABC#3)
// _SafeStr_7284 = "_-Lr" (String#7987, DoABC#3)
// _SafeStr_7285 = "_-W1v" (String#8726, DoABC#3)
// _SafeStr_7286 = "_-71k" (String#7026, DoABC#3)
// _SafeStr_7287 = "_-eO" (String#9304, DoABC#3)
// _SafeStr_7288 = "_-312" (String#6711, DoABC#3)
// _SafeStr_7289 = "_-fJ" (String#9361, DoABC#3)
// _SafeStr_7290 = "_-C1L" (String#7360, DoABC#3)
// _SafeStr_7291 = "_-W1O" (String#8707, DoABC#3)
// _SafeStr_7292 = "_-h1L" (String#9464, DoABC#3)
// _SafeStr_7293 = "_-a1h" (String#8983, DoABC#3)
// _SafeStr_7294 = "_-r1G" (String#10121, DoABC#3)
// _SafeStr_7295 = "_-TQ" (String#8516, DoABC#3)
// _SafeStr_7296 = "_-1t" (String#6621, DoABC#3)
// _SafeStr_7297 = "_-U1M" (String#8553, DoABC#3)
// _SafeStr_7298 = "_-Ai" (String#7292, DoABC#3)
// _SafeStr_7299 = "_-zF" (String#10688, DoABC#3)
// _SafeStr_7300 = "_-5r" (String#6931, DoABC#3)
// _SafeStr_7301 = "_-B1e" (String#7313, DoABC#3)
// _SafeStr_7302 = "_-L18" (String#7932, DoABC#3)



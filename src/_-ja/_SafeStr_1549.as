// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ja._SafeStr_1549

package _-Ja
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1549 implements _SafeStr_13 
    {

        public static const _SafeStr_7272:int = 1;
        public static const _SafeStr_7273:int = 2;
        public static const _SafeStr_7274:int = 4;

        private var _index:int;
        private var _SafeStr_7275:String;
        private var _SafeStr_7276:String;
        private var _SafeStr_7277:Boolean;
        private var _SafeStr_7278:String;
        private var _SafeStr_5480:String;
        private var _SafeStr_7279:int;
        private var _SafeStr_6279:int;
        private var _SafeStr_4028:int;
        private var _SafeStr_4019:String;
        private var _SafeStr_6495:_SafeStr_1569;
        private var _open:Boolean;
        private var _disposed:Boolean;

        public function _SafeStr_1549(_arg_1:IMessageDataWrapper)
        {
            _index = _arg_1.readInteger();
            _SafeStr_7275 = _arg_1.readString();
            _SafeStr_7276 = _arg_1.readString();
            _SafeStr_7277 = (_arg_1.readInteger() == 1);
            _SafeStr_7278 = _arg_1.readString();
            _SafeStr_5480 = _arg_1.readString();
            _SafeStr_7279 = _arg_1.readInteger();
            _SafeStr_6279 = _arg_1.readInteger();
            _SafeStr_4028 = _arg_1.readInteger();
            if (_SafeStr_4028 == 1)
            {
                _SafeStr_4019 = _arg_1.readString();
            }
            else
            {
                if (_SafeStr_4028 == 2)
                {
                    _SafeStr_6495 = new _SafeStr_1569(_arg_1);
                }
                else
                {
                    _open = _arg_1.readBoolean();
                };
            };
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            if (this._SafeStr_6495 != null)
            {
                this._SafeStr_6495.dispose();
                this._SafeStr_6495 = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        public function get index():int
        {
            return (_index);
        }

        public function get popupCaption():String
        {
            return (_SafeStr_7275);
        }

        public function get popupDesc():String
        {
            return (_SafeStr_7276);
        }

        public function get showDetails():Boolean
        {
            return (_SafeStr_7277);
        }

        public function get picText():String
        {
            return (_SafeStr_7278);
        }

        public function get picRef():String
        {
            return (_SafeStr_5480);
        }

        public function get folderId():int
        {
            return (_SafeStr_7279);
        }

        public function get tag():String
        {
            return (_SafeStr_4019);
        }

        public function get userCount():int
        {
            return (_SafeStr_6279);
        }

        public function get guestRoomData():_SafeStr_1569
        {
            return (_SafeStr_6495);
        }

        public function get open():Boolean
        {
            return (_open);
        }

        public function toggleOpen():void
        {
            _open = (!(_open));
        }

        public function get maxUsers():int
        {
            if (this.type == 1)
            {
                return (0);
            };
            if (this.type == 2)
            {
                return (this._SafeStr_6495.maxUserCount);
            };
            return (0);
        }


    }
}//package _-Ja

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1549 = "_-jk" (String#9650, DoABC#3)
// _SafeStr_1569 = "_-R1p" (String#8356, DoABC#3)
// _SafeStr_4019 = "_-LH" (String#7966, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_5480 = "_-22c" (String#6672, DoABC#3)
// _SafeStr_6279 = "_-tN" (String#10281, DoABC#3)
// _SafeStr_6495 = "_-n1A" (String#9855, DoABC#3)
// _SafeStr_7272 = "_-y1g" (String#10595, DoABC#3)
// _SafeStr_7273 = "_-d1d" (String#9186, DoABC#3)
// _SafeStr_7274 = "_-o0" (String#9920, DoABC#3)
// _SafeStr_7275 = "_-L1a" (String#7951, DoABC#3)
// _SafeStr_7276 = "_-P1Q" (String#8238, DoABC#3)
// _SafeStr_7277 = "_-q18" (String#10035, DoABC#3)
// _SafeStr_7278 = "_-4K" (String#6848, DoABC#3)
// _SafeStr_7279 = "_-e1t" (String#9291, DoABC#3)



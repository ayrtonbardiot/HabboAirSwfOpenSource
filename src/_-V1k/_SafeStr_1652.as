// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-V1k._SafeStr_1652

package _-V1k
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1652 implements _SafeStr_13 
    {

        private var _SafeStr_7608:Array;
        private var _SafeStr_7609:Array;
        private var _SafeStr_4994:Array;
        private var _SafeStr_7610:Boolean;
        private var _SafeStr_7611:Boolean;
        private var _SafeStr_7612:Boolean;
        private var _SafeStr_7613:Boolean;
        private var _SafeStr_7614:Boolean;
        private var _SafeStr_7615:Boolean;
        private var _SafeStr_7616:Boolean;
        private var _disposed:Boolean;

        public function _SafeStr_1652(_arg_1:IMessageDataWrapper)
        {
            var _local_4:int;
            super();
            var _local_2:_SafeStr_1513 = new _SafeStr_1513();
            _SafeStr_4994 = [];
            _SafeStr_7608 = [];
            _SafeStr_7609 = [];
            var _local_3:int = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                if (_local_2.parse(_arg_1))
                {
                    _SafeStr_4994.push(_local_2.issueData);
                };
                _local_4++;
            };
            _local_3 = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _SafeStr_7608.push(_arg_1.readString());
                _local_4++;
            };
            _local_3 = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _arg_1.readString();
                _local_4++;
            };
            _SafeStr_7610 = _arg_1.readBoolean();
            _SafeStr_7611 = _arg_1.readBoolean();
            _SafeStr_7612 = _arg_1.readBoolean();
            _SafeStr_7613 = _arg_1.readBoolean();
            _SafeStr_7614 = _arg_1.readBoolean();
            _SafeStr_7615 = _arg_1.readBoolean();
            _SafeStr_7616 = _arg_1.readBoolean();
            _local_3 = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _SafeStr_7609.push(_arg_1.readString());
                _local_4++;
            };
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            _SafeStr_7608 = null;
            _SafeStr_7609 = null;
            _SafeStr_4994 = null;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get messageTemplates():Array
        {
            return (_SafeStr_7608);
        }

        public function get roomMessageTemplates():Array
        {
            return (_SafeStr_7609);
        }

        public function get issues():Array
        {
            return (_SafeStr_4994);
        }

        public function get cfhPermission():Boolean
        {
            return (_SafeStr_7610);
        }

        public function get chatlogsPermission():Boolean
        {
            return (_SafeStr_7611);
        }

        public function get alertPermission():Boolean
        {
            return (_SafeStr_7612);
        }

        public function get kickPermission():Boolean
        {
            return (_SafeStr_7613);
        }

        public function get banPermission():Boolean
        {
            return (_SafeStr_7614);
        }

        public function get roomAlertPermission():Boolean
        {
            return (_SafeStr_7615);
        }

        public function get roomKickPermission():Boolean
        {
            return (_SafeStr_7616);
        }


    }
}//package _-V1k

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1513 = "_-GN" (String#7629, DoABC#3)
// _SafeStr_1652 = "_-Mv" (String#8045, DoABC#3)
// _SafeStr_4994 = "_-XA" (String#8796, DoABC#3)
// _SafeStr_7608 = "_-Ak" (String#7293, DoABC#3)
// _SafeStr_7609 = "_-ce" (String#9152, DoABC#3)
// _SafeStr_7610 = "_-W15" (String#8661, DoABC#3)
// _SafeStr_7611 = "_-S1n" (String#8420, DoABC#3)
// _SafeStr_7612 = "_-Y1p" (String#8852, DoABC#3)
// _SafeStr_7613 = "_-Iy" (String#7763, DoABC#3)
// _SafeStr_7614 = "_-f1F" (String#9329, DoABC#3)
// _SafeStr_7615 = "_-rO" (String#10155, DoABC#3)
// _SafeStr_7616 = "_-XX" (String#8808, DoABC#3)



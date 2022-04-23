// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_1216

package _-W1K
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.room.utils.ColorConverter;
    import com.sulake.room.utils.IVector3d;

    [SecureSWF(rename="true")]
    public class _SafeStr_1216 
    {

        private var _SafeStr_7658:Vector.<_SafeStr_1578> = new Vector.<_SafeStr_1578>();
        private var _SafeStr_7659:Vector.<_SafeStr_1578> = new Vector.<_SafeStr_1578>();
        private var _SafeStr_7660:Vector.<_SafeStr_1581> = new Vector.<_SafeStr_1581>();
        private var _SafeStr_7661:Vector.<_SafeStr_1581> = new Vector.<_SafeStr_1581>();
        private var _SafeStr_7662:Vector.<_SafeStr_1581> = new Vector.<_SafeStr_1581>();

        public function _SafeStr_1216(_arg_1:IMessageDataWrapper=null)
        {
            var _local_3:int;
            var _local_2:int;
            super();
            _local_2 = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7658.push(new _SafeStr_1578(_arg_1));
                _local_3++;
            };
            _local_2 = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7659.push(new _SafeStr_1578(_arg_1));
                _local_3++;
            };
            _local_2 = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7660.push(new _SafeStr_1581(_arg_1));
                _local_3++;
            };
            _local_2 = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7661.push(new _SafeStr_1581(_arg_1));
                _local_3++;
            };
            _local_2 = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7662.push(new _SafeStr_1581(_arg_1));
                _local_3++;
            };
        }

        public function get baseParts():Vector.<_SafeStr_1578>
        {
            return (_SafeStr_7658);
        }

        public function get layerParts():Vector.<_SafeStr_1578>
        {
            return (_SafeStr_7659);
        }

        public function get badgeColors():Vector.<_SafeStr_1581>
        {
            return (_SafeStr_7660);
        }

        public function get guildPrimaryColors():Vector.<_SafeStr_1581>
        {
            return (_SafeStr_7661);
        }

        public function get guildSecondaryColors():Vector.<_SafeStr_1581>
        {
            return (_SafeStr_7662);
        }

        public function findMatchingPrimaryColorId(_arg_1:int):int
        {
            if (((((_arg_1 < 0) || (_SafeStr_7660.length <= 0)) || (_SafeStr_7660.length < _arg_1)) || (_SafeStr_7661.length <= 0)))
            {
                return (0);
            };
            return (findClosestColor(_SafeStr_7660[_arg_1], _SafeStr_7661));
        }

        public function findMatchingSecondaryColorId(_arg_1:int):int
        {
            if (((((_arg_1 < 0) || (_SafeStr_7660.length <= 0)) || (_SafeStr_7660.length < _arg_1)) || (_SafeStr_7662.length <= 0)))
            {
                return (0);
            };
            return (findClosestColor(_SafeStr_7660[_arg_1], _SafeStr_7662));
        }

        private function findClosestColor(_arg_1:_SafeStr_1581, _arg_2:Vector.<_SafeStr_1581>):int
        {
            var _local_8:int;
            var _local_5:* = null;
            var _local_6:Number;
            var _local_4:IVector3d = ColorConverter.rgb2CieLab(_arg_1.color);
            var _local_7:int;
            var _local_3:* = 1.79769313486232E308;
            _local_8 = 0;
            while (_local_8 < _arg_2.length)
            {
                _local_5 = ColorConverter.rgb2CieLab(_arg_2[_local_8].color);
                _local_6 = ((Math.pow((_local_4.x - _local_5.x), 2) + Math.pow((_local_4.y - _local_5.y), 2)) + Math.pow((_local_4.z - _local_5.z), 2));
                if (_local_6 < _local_3)
                {
                    _local_3 = _local_6;
                    _local_7 = _local_8;
                };
                _local_8++;
            };
            return (_arg_2[_local_7].id);
        }


    }
}//package _-W1K

// _SafeStr_1216 = "_-4R" (String#6852, DoABC#3)
// _SafeStr_1578 = "_-h5" (String#9486, DoABC#3)
// _SafeStr_1581 = "_-A1O" (String#7221, DoABC#3)
// _SafeStr_7658 = "_-Pf" (String#8272, DoABC#3)
// _SafeStr_7659 = "_-L2" (String#7959, DoABC#3)
// _SafeStr_7660 = "_-t1C" (String#10245, DoABC#3)
// _SafeStr_7661 = "_-o1V" (String#9931, DoABC#3)
// _SafeStr_7662 = "_-21V" (String#6635, DoABC#3)



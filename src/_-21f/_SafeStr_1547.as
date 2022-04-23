// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-21f._SafeStr_1547

package _-21f
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import _-Ja._SafeStr_1569;

    [SecureSWF(rename="true")]
    public class _SafeStr_1547 
    {

        private var _SafeStr_4724:String;
        private var _SafeStr_4725:String;
        private var _SafeStr_7013:Vector.<_SafeStr_1663> = new Vector.<_SafeStr_1663>(0);

        public function _SafeStr_1547(_arg_1:IMessageDataWrapper, _arg_2:_SafeStr_1663=null)
        {
            var _local_3:int;
            var _local_4:int;
            super();
            if (_arg_2 != null)
            {
                _SafeStr_4724 = _arg_2.searchCode;
                _SafeStr_4725 = _arg_2.text;
                _SafeStr_7013.push(_arg_2);
            }
            else
            {
                _SafeStr_4724 = _arg_1.readString();
                _SafeStr_4725 = _arg_1.readString();
                _local_3 = _arg_1.readInteger();
                _local_4 = 0;
                while (_local_4 < _local_3)
                {
                    _SafeStr_7013.push(new _SafeStr_1663(_arg_1));
                    _local_4++;
                };
            };
        }

        public function get searchCodeOriginal():String
        {
            return (_SafeStr_4724);
        }

        public function get filteringData():String
        {
            return (_SafeStr_4725);
        }

        public function get blocks():Vector.<_SafeStr_1663>
        {
            return (_SafeStr_7013);
        }

        public function findGuestRoom(_arg_1:int):_SafeStr_1569
        {
            var _local_3:* = null;
            for each (var _local_2:_SafeStr_1663 in _SafeStr_7013)
            {
                _local_3 = _local_2.findGuestRoom(_arg_1);
                if (_local_3 != null)
                {
                    return (_local_3);
                };
            };
            return (null);
        }


    }
}//package _-21f

// _SafeStr_1547 = "_-E1O" (String#7472, DoABC#3)
// _SafeStr_1569 = "_-R1p" (String#8356, DoABC#3)
// _SafeStr_1663 = "_-l1U" (String#9748, DoABC#3)
// _SafeStr_4724 = "_-sh" (String#10232, DoABC#3)
// _SafeStr_4725 = "_-O" (String#8126, DoABC#3)
// _SafeStr_7013 = "_-vP" (String#10415, DoABC#3)



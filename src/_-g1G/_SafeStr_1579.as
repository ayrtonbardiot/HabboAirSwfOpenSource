// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-g1G._SafeStr_1579

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1579 
    {

        private var _SafeStr_4028:int;
        private var _SafeStr_5919:int;
        private var _SafeStr_4043:int;
        private var _SafeStr_5711:Boolean;
        private var _SafeStr_7251:Boolean;

        public function _SafeStr_1579(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_4028 = _arg_1.readInteger();
            _SafeStr_5919 = _arg_1.readInteger();
            _SafeStr_4043 = _arg_1.readInteger();
            _SafeStr_5711 = _arg_1.readBoolean();
            _SafeStr_7251 = _arg_1.readBoolean();
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        public function get breedId():int
        {
            return (_SafeStr_5919);
        }

        public function get paletteId():int
        {
            return (_SafeStr_4043);
        }

        public function get sellable():Boolean
        {
            return (_SafeStr_5711);
        }

        public function get rare():Boolean
        {
            return (_SafeStr_7251);
        }


    }
}//package _-g1G

// _SafeStr_1579 = "_-32n" (String#6754, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_4043 = "_-Ru" (String#8389, DoABC#3)
// _SafeStr_5711 = "_-iG" (String#9555, DoABC#3)
// _SafeStr_5919 = "_-e1Z" (String#9277, DoABC#3)
// _SafeStr_7251 = "_-02H" (String#6507, DoABC#3)



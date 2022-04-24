// by nota

//_-a1U.NftWardrobeItem

package _-a1U
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class NftWardrobeItem 
    {

        private var _SafeStr_6436:int;
        private var _SafeStr_3834:String;
        private var _figureString:String;
        private var _SafeStr_5754:int;
        private var _SafeStr_7144:int;
        private var _SafeStr_7145:Boolean;

        public function NftWardrobeItem(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_6436 = _arg_1.readInteger();
            _figureString = _arg_1.readString();
            _SafeStr_3834 = _arg_1.readString();
        }

        public function get tokenId():int
        {
            return (_SafeStr_6436);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }

        public function get figureString():String
        {
            return (_figureString);
        }

        public function get avatarEffectType():int
        {
            return (_SafeStr_5754);
        }

        public function get avatarEffectDuration():int
        {
            return (_SafeStr_7144);
        }

        public function get avatarEffectPermanent():Boolean
        {
            return (_SafeStr_7145);
        }


    }
}//package _-a1U

// _SafeStr_3834 = "_-tK" (String#10279, DoABC#3)
// _SafeStr_5754 = "_-cT" (String#9144, DoABC#3)
// _SafeStr_6436 = "_-5H" (String#6910, DoABC#3)
// _SafeStr_7144 = "_-M11" (String#7991, DoABC#3)
// _SafeStr_7145 = "_-d18" (String#9171, DoABC#3)



// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-JS._SafeStr_1604

package _-JS
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1604 
    {

        private var _SafeStr_3911:int;
        private var _avatarName:String;
        private var _SafeStr_7334:String;
        private var _SafeStr_7335:Boolean;
        private var _SafeStr_7336:Boolean;
        private var _SafeStr_7337:int;
        private var _SafeStr_7338:String;
        private var _SafeStr_7339:String;
        private var _realName:String;

        public function _SafeStr_1604(_arg_1:IMessageDataWrapper)
        {
            this._SafeStr_3911 = _arg_1.readInteger();
            this._avatarName = _arg_1.readString();
            this._SafeStr_7334 = _arg_1.readString();
            this._SafeStr_7335 = _arg_1.readBoolean();
            this._SafeStr_7336 = _arg_1.readBoolean();
            _arg_1.readString();
            this._SafeStr_7337 = _arg_1.readInteger();
            this._SafeStr_7338 = _arg_1.readString();
            this._realName = _arg_1.readString();
        }

        public function get avatarId():int
        {
            return (this._SafeStr_3911);
        }

        public function get avatarName():String
        {
            return (this._avatarName);
        }

        public function get avatarMotto():String
        {
            return (this._SafeStr_7334);
        }

        public function get isAvatarOnline():Boolean
        {
            return (this._SafeStr_7335);
        }

        public function get canFollow():Boolean
        {
            return (this._SafeStr_7336);
        }

        public function get avatarGender():int
        {
            return (this._SafeStr_7337);
        }

        public function get avatarFigure():String
        {
            return (this._SafeStr_7338);
        }

        public function get lastOnlineDate():String
        {
            return (this._SafeStr_7339);
        }

        public function get realName():String
        {
            return (this._realName);
        }


    }
}//package _-JS

// _SafeStr_1604 = "_-S10" (String#8392, DoABC#3)
// _SafeStr_3911 = "_-mj" (String#9839, DoABC#3)
// _SafeStr_7334 = "_-ZT" (String#8941, DoABC#3)
// _SafeStr_7335 = "_-9S" (String#7192, DoABC#3)
// _SafeStr_7336 = "_-q1" (String#10030, DoABC#3)
// _SafeStr_7337 = "_-s1q" (String#10202, DoABC#3)
// _SafeStr_7338 = "_-U1b" (String#8558, DoABC#3)
// _SafeStr_7339 = "_-QI" (String#8317, DoABC#3)



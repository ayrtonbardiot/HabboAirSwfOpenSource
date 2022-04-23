// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.wardrobe.NftOutfit

package com.sulake.habbo.avatar.wardrobe
{
    import com.sulake.habbo.avatar.HabboAvatarEditor;

    public class NftOutfit extends Outfit 
    {

        private var _SafeStr_6436:int;

        public function NftOutfit(_arg_1:HabboAvatarEditor, _arg_2:int, _arg_3:String, _arg_4:String)
        {
            super(_arg_1, _arg_3, _arg_4);
            this._SafeStr_6436 = _arg_2;
        }

        public function get tokenId():int
        {
            return (_SafeStr_6436);
        }


    }
}//package com.sulake.habbo.avatar.wardrobe

// _SafeStr_6436 = "_-5H" (String#24105, DoABC#4)



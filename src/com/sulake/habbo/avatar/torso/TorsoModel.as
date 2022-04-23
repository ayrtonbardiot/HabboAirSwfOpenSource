// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.torso.TorsoModel

package com.sulake.habbo.avatar.torso
{
    import com.sulake.habbo.avatar.common.CategoryBaseModel;
    import com.sulake.habbo.avatar.common._SafeStr_3301;
    import com.sulake.habbo.avatar.HabboAvatarEditor;

    public class TorsoModel extends CategoryBaseModel implements _SafeStr_3301 
    {

        public function TorsoModel(_arg_1:HabboAvatarEditor)
        {
            super(_arg_1);
        }

        override protected function init():void
        {
            super.init();
            initCategory("cc");
            initCategory("ch");
            initCategory("ca");
            initCategory("cp");
            _SafeStr_3883 = true;
            if (!_SafeStr_3882)
            {
                _SafeStr_3882 = new TorsoView(this);
                if (_SafeStr_3882)
                {
                    _SafeStr_3882.init();
                };
            };
        }


    }
}//package com.sulake.habbo.avatar.torso

// _SafeStr_3301 = "_-f1d" (String#2199, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)



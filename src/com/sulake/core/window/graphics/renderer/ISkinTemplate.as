// by nota

//com.sulake.core.window.graphics.renderer.ISkinTemplate

package com.sulake.core.window.graphics.renderer
{
    import com.sulake.core.window.utils.IChildEntityArray;
    import com.sulake.core.window.utils._SafeStr_3239;
    import com.sulake.core.assets.IAsset;

    public /*dynamic*/ interface ISkinTemplate extends IChildEntityArray, _SafeStr_3239 
    {

        function get asset():IAsset;
        function dispose():void;

    }
}//package com.sulake.core.window.graphics.renderer

// _SafeStr_3239 = "_-Uz" (String#1888, DoABC#4)



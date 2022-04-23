// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.PromoArticleWidget

package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Eh._SafeStr_159;
    import com.sulake.habbo.communication.messages.outgoing.landingview._SafeStr_768;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
    import com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;
    import _-Eh._SafeStr_1631;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events._SafeStr_3116;

    public class PromoArticleWidget implements ILandingViewWidget, ISettingsAwareWidget, _SafeStr_41 
    {

        private static const REFRESH_PERIOD_IN_MILLIS:Number = 600000;
        private static const FADE_LENGTH:Number = 500;
        private static const MAX_ARTICLES:int = 10;

        private var _landingView:HabboLandingView;
        private var _container:_SafeStr_3133;
        private var _SafeStr_6933:int = 0;
        private var _SafeStr_6934:Array = [];
        private var _lastRequestTime:Date;
        private var _SafeStr_6932:IMessageEvent;
        private var _SafeStr_6935:uint = 0;

        public function PromoArticleWidget(_arg_1:HabboLandingView)
        {
            _landingView = _arg_1;
        }

        public function initialize():void
        {
            _container = _SafeStr_3133(_landingView.getXmlWindow("promo_article"));
            _container.procedure = onMouse;
            _SafeStr_6932 = new _SafeStr_159(onPromoArticles);
            _landingView.communicationManager.addHabboConnectionMessageEvent(_SafeStr_6932);
        }

        public function refresh():void
        {
            if (((_lastRequestTime == null) || ((_lastRequestTime.time + 600000) < new Date().time)))
            {
                _landingView.send(new _SafeStr_768());
                _lastRequestTime = new Date();
            }
            else
            {
                goToArticle(_SafeStr_6933);
            };
        }

        public function get container():_SafeStr_3109
        {
            return (_container);
        }

        public function dispose():void
        {
            if (((_SafeStr_6932) && (_landingView)))
            {
                _landingView.communicationManager.removeHabboConnectionMessageEvent(_SafeStr_6932);
                _SafeStr_6932.dispose();
                _SafeStr_6932 = null;
            };
            if (_container)
            {
                _container.dispose();
                _container = null;
            };
            _landingView = null;
        }

        public function get disposed():Boolean
        {
            return (_landingView == null);
        }

        public function set settings(_arg_1:CommonWidgetSettings):void
        {
            WidgetContainerLayout.applyCommonWidgetSettings(_container, _arg_1);
        }

        private function refreshContent():void
        {
            setArticleContent();
            setNavigationDisks();
        }

        private function setArticleContent():void
        {
            var _local_1:_SafeStr_1631 = _SafeStr_6934[_SafeStr_6933];
            if (_local_1)
            {
                _container.findChildByName("promo_title").caption = _local_1.title;
                _container.findChildByName("promo_text").caption = _local_1.bodyText;
                _container.findChildByName("button").visible = (!((_local_1.linkType == 2) || ((_local_1.linkType == 0) && (_local_1.linkContent == ""))));
                _container.findChildByName("button").immediateClickMode = true;
                _container.findChildByName("button").caption = _local_1.buttonText;
                _container.findChildByName("promo_image").visible = (!(_local_1.imageUrl == ""));
                try
                {
                    IStaticBitmapWrapperWindow(_container.findChildByName("promo_image")).assetUri = ("${image.library.url}" + _local_1.imageUrl);
                }
                catch(e:Error)
                {
                    _landingView.context.warning(("Missing image url for promo article with title: " + _local_1.title));
                };
            };
        }

        private function setNavigationDisks():void
        {
            var _local_3:int;
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_1:_SafeStr_3133 = _SafeStr_3133(_container.findChildByName("navigation"));
            _local_3 = 0;
            while (_local_3 < 10)
            {
                _local_4 = IRegionWindow(_local_1.getChildAt(_local_3));
                if (_SafeStr_6934.length > _local_3)
                {
                    _local_2 = IStaticBitmapWrapperWindow(_local_4.getChildAt(0));
                    _local_2.assetUri = ("progress_disk_flat_" + ((_SafeStr_6933 == _local_3) ? "on" : "off"));
                    _local_4.visible = true;
                }
                else
                {
                    _local_4.visible = false;
                };
                _local_3++;
            };
        }

        private function goToArticle(_arg_1:int):void
        {
            var _local_2:* = (_arg_1 == _SafeStr_6933);
            if (_SafeStr_6934.length == 0)
            {
                return;
            };
            if (_arg_1 < 0)
            {
                _SafeStr_6933 = (_SafeStr_6934.length - 1);
            }
            else
            {
                if (_arg_1 >= _SafeStr_6934.length)
                {
                    _SafeStr_6933 = 0;
                }
                else
                {
                    _SafeStr_6933 = _arg_1;
                };
            };
            if (_local_2)
            {
                refreshContent();
            }
            else
            {
                startFade();
            };
        }

        private function startFade():void
        {
            _SafeStr_6935 = 0;
            _landingView.registerUpdateReceiver(this, 1);
        }

        private function stopFade():void
        {
            _landingView.removeUpdateReceiver(this);
            setBlend(1);
        }

        private function followLink():void
        {
            var _local_1:_SafeStr_1631 = _SafeStr_6934[_SafeStr_6933];
            switch (_local_1.linkType)
            {
                case 0:
                    HabboWebTools.openWebPage(_local_1.linkContent);
                    return;
                case 1:
                    _landingView.context.createLinkEvent(_local_1.linkContent);
                default:
            };
        }

        private function onMouse(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_2.name == "article_navigation")
            {
                if (_arg_1.type == "WME_OVER")
                {
                    hoverOverNavigation(_arg_2, true);
                }
                else
                {
                    if (((_arg_1.type == "WME_OUT") && (!(_arg_2.id == _SafeStr_6933))))
                    {
                        hoverOverNavigation(_arg_2, false);
                    };
                };
            };
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "button":
                    followLink();
                    return;
                case "article_navigation":
                    goToArticle(_arg_2.id);
                    return;
            };
        }

        private function hoverOverNavigation(_arg_1:_SafeStr_3109, _arg_2:Boolean):void
        {
            var _local_3:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(_SafeStr_3133(_arg_1).getChildAt(0));
            if (!_local_3)
            {
                return;
            };
            _local_3.assetUri = ("progress_disk_flat_" + ((_arg_2) ? "on" : "off"));
        }

        private function onPromoArticles(_arg_1:_SafeStr_159):void
        {
            _SafeStr_6934 = [];
            for each (var _local_2:_SafeStr_1631 in _arg_1.getParser().articles)
            {
                _SafeStr_6934.push(_local_2);
            };
            refresh();
        }

        private function setBlend(_arg_1:Number):void
        {
            _container.findChildByName("promo_title").blend = _arg_1;
            _container.findChildByName("promo_text").blend = _arg_1;
            _container.findChildByName("button").blend = _arg_1;
            _container.findChildByName("promo_image").blend = _arg_1;
        }

        public function update(_arg_1:uint):void
        {
            var _local_2:uint = (_SafeStr_6935 + _arg_1);
            if (_SafeStr_6935 < 500)
            {
                setBlend(Math.max(0, (1 - (_SafeStr_6935 / 500))));
                if (_local_2 >= 500)
                {
                    refreshContent();
                };
            }
            else
            {
                setBlend(Math.min(1, ((_SafeStr_6935 - 500) / 500)));
            };
            _SafeStr_6935 = _local_2;
            if (_SafeStr_6935 >= (500 * 2))
            {
                stopFade();
            };
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget

// _SafeStr_159 = "_-J13" (String#25463, DoABC#4)
// _SafeStr_1631 = "_-91" (String#24589, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_6932 = "_-xR" (String#8742, DoABC#4)
// _SafeStr_6933 = "_-n14" (String#5661, DoABC#4)
// _SafeStr_6934 = "_-b1I" (String#6405, DoABC#4)
// _SafeStr_6935 = "_-41g" (String#7204, DoABC#4)
// _SafeStr_768 = "_-E14" (String#30014, DoABC#4)



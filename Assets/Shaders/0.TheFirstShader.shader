/******************************************************************************************
*实现功能：凹凸纹理显示+自选边缘颜色和强度
******************************************************************************************/

Shader "Custom/0.TheFirstShader" {
	//属性
	Properties {
		_MainTex("【纹理】Texture", 2D) = "white" {}
		_BumpMap("【凹凸纹理】Bumpmap",2D) = "bump" {}
		_RimColor("【边缘颜色】Rim Color",Color) = (0.17,0.36,0.81,0.0)
		_RimPower("【边缘颜色强度】Rim Power",Range(0.6,9.0)) = 1.0
	}

	//开始一个子着色器
	SubShader {
		//渲染类型为Opaque，不透明
		Tags { "RenderType"="Opaque" }
		
		//开始CG着色器编程语言段
		CGPROGRAM

		//使用兰伯特光照模式
		#pragma surface surf Lambert

		sampler2D _MainTex;

		
		struct Input {
			float2 uv_MainTex;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			half4 c = tex2D (_MainTex, IN.uv_MainTex);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}

//To use this shader, create a Material in Unity and assign the shader with it. 
//Give the model the created Material, and it's done.

Shader "xShader/Shader0" {
	SubShader {
		Tags { "RenderType"="Opaque" }
		
		pass {
			CGPROGRAM
			
			#pragma vertex vert
			#pragma fragment frag
			
			//struct uses Semantic binding (like classify in life)
			struct VetexOutput{
				float4 pos :SV_POSITION;
				float4 texcoord: TEXCOORD;
			};
			
			
			VetexOutput vert(in float4 pos:POSITION /*use Semantic binding in params*/)
			{
				VetexOutput output;
				output.pos = mul(UNITY_MATRIX_MVP, pos);
				output.texcoord = pos + float4(0.5, 0.5, 0.5, 0);
				
				return output;
			}
			
			float4 frag(VetexOutput input) :COLOR //use Semantic binding after function
			{
				return input.texcoord;
			}
			
			ENDCG
		}

	} 
	FallBack "Diffuse"
}
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SearchItems extends StatelessWidget {
  const SearchItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 3,
            color: Colors.grey.withOpacity(.2)
          )
        ],
      ),
      padding: const EdgeInsets.all(13),
      child: Column(
        children: [
          SizedBox(
            height: 110,
            child: Row(
              children: [
               Container(
                width: 130,
                height: 110,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Image.network("https://zvencity.ru/images/news/2022/03/doctor.jpeg",fit: BoxFit.cover,),
               ),
               const SizedBox(width: 15,),
               const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Dr.Shruti Kedia",maxLines: 1,overflow: TextOverflow.ellipsis,),
                            Icon(Iconsax.heart5,color: Colors.red,size: 28,),
                          ],
                        ),
                        //dr type
                        Text("Tooths Dentist",style: TextStyle(color: Colors.green,overflow: TextOverflow.ellipsis,),),
                        Text("7 Years experience",style: TextStyle(color: Colors.grey,overflow: TextOverflow.ellipsis,),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(radius: 7,backgroundColor: Colors.green,),
                            SizedBox(width: 5,),
                            Text("87%",style: TextStyle(color: Colors.grey,fontSize: 11),maxLines: 1,)
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(radius: 7,backgroundColor: Colors.green,),
                            SizedBox(width: 5,),
                            Text("69 Patient Stories",style: TextStyle(color: Colors.grey,overflow: TextOverflow.ellipsis,fontSize: 11))
                          ],
                        )
                      ],
                    )
                  ],
                ),
               )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Next Available",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(text: "10:00",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)),
                          TextSpan(text: "AM tomorrow",style: TextStyle(color: Colors.grey))
                        ]
                      ),
                    )
                  ],
                ),
                const Spacer(),
                ZoomTapAnimation(
                  onTap: () {},
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.green
                    ),
                    child: const Center(child: Text("Book Now",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
  }
}